import 'package:flutter/material.dart';
import 'package:weather/autification/auth.dart';
import 'package:weather/backend_client/give_data_account_backend.dart';
import 'package:weather/home/account/account_email.dart';
import 'package:weather/home/account/account_rename.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'package:visibility_detector/visibility_detector.dart';

// для отчистки
import 'package:weather/provid/reset_provid.dart';






class Account extends StatefulWidget { 
  const Account({super.key});

  @override
  State<Account> createState() => _Account();
}


class _Account extends State<Account>{ 

  bool loading = false;

  Future<void> _loading_data() async{

    String user_id = context.read<Data_User_Provid>().user_id;

    
    final res = await Give_data_accoun_back.res(user_id);

    if(res["status"] == "success"){

      var data = res["data"];
      String id_user = data["ID"].toString();
      String coins = res["coins"].toString();

      context.read<Data_User_Provid>().name_ren(data["NAME"]);
      context.read<Data_User_Provid>().email_ren(data["EMAIL"]);
      context.read<Data_User_Provid>().date_birth_ren(data["DATE"]);
      context.read<Data_User_Provid>().phone_ren(data["PHONE"]);
      context.read<Data_User_Provid>().user_id_ren(id_user);
      context.read<Data_User_Provid>().coins_ren(coins);
      loading = true;

    }
  }


  @override
  void initState() {
    super.initState();
    _loading_data();
  }

  
  @override
  Widget build(BuildContext context) {

    final data = context.watch<Data_User_Provid>();

    List split_date = data.date_birth.split("/");

    List mas_month = ["Января", "Февраля", 
    "Марта", "Апреля", "Мая", "Июня", 
    "Июля", "Августа", "Сентября", "Октября", 
    "Ноября", "Декабря"];

    String month = mas_month[(int.parse(split_date[1])) - 1];


    if(loading == false){
      return VisibilityDetector(
        key: const Key('pizza'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction > 0.5) {
            _loading_data();
          }
        },
        child: Center(
          child: Text("Интернета нет"),
        )
      );
    }

    return VisibilityDetector(
      key: const Key('pizza'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5) {
          _loading_data();
        }
      },
      child: Center(
        child: ListView(
        children: [
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Image(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/img/free-icon-font-coins.png",),
                        width: 30,
                        height: 30,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "${data.coins}",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 46, 46, 46),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30)),
                      Text(
                        "Накопленные баллы",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 46, 46, 46),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                ],
              )
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(
                          Icons.account_circle_outlined,
                          color: const Color.fromARGB(255, 46, 46, 46),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          "${data.name}",
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 46, 46, 46),
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 248, 248, 248),
                          shadowColor: Color.fromARGB(0, 255, 255, 255),
                          overlayColor: Color.fromARGB(0, 158, 158, 158),
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          minimumSize: Size.zero,
                        ),
                        onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return Account_rename();
                                }
                              )
                            );
                        },
                        child:  Icon(
                          Icons.edit_outlined,
                          size: 17,
                          color: const Color.fromARGB(255, 46, 46, 46),
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(
                          Icons.email_outlined,
                          color: const Color.fromARGB(255, 46, 46, 46),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          "${data.email}",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 46, 46, 46),
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 248, 248, 248),
                          shadowColor: Color.fromARGB(0, 255, 255, 255),
                          overlayColor: Color.fromARGB(0, 158, 158, 158),
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          minimumSize: Size.zero,
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return Account_email();
                                }
                              )
                            );
                        },
                        child:  Icon(
                          Icons.edit_outlined,
                          size: 17,
                          color: const Color.fromARGB(255, 46, 46, 46),
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Icon(
                      Icons.cake_outlined,
                      color: const Color.fromARGB(255, 46, 46, 46),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      "${int.parse(split_date[0])} ${month}",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Icon(
                      Icons.phone_outlined,
                      color: const Color.fromARGB(255, 46, 46, 46),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Text(
                      "${data.phone}",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 248, 248, 248),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 248, 248),
                    shadowColor: Color.fromARGB(0, 255, 255, 255),
                    overlayColor: Color.fromARGB(255, 158, 158, 158),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    minimumSize: Size.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fixedSize: Size(double.infinity, 60),
                  ),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 248, 248, 248),
                          title: Text('Выход из аккаунта'),
                          content: Text('Вы уверены, что хотите выйти из аккаунта?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Назад',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 46, 46, 46),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {

                                Provider.of<Resetprovider>(context, listen: false).logout();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context){
                                      return Auth();
                                    }
                                  )
                                );
                              },
                              child: Text(
                                'ОК',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 46, 46, 46),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(
                            Icons.exit_to_app_outlined,
                            color: const Color.fromARGB(255, 46, 46, 46),
                            size: 22,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            "Выход",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 46, 46, 46),
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 20,
                          color: const Color.fromARGB(255, 46, 46, 46),
                        ),
                      )
                    ],
                  ),
                )
              ),
            ],
          ),
        ],
      )
    )
  );
}

}