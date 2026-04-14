import 'package:flutter/material.dart';
import 'package:weather/autification/auth.dart';
import 'package:weather/home/account/account_email.dart';
import 'package:weather/home/account/account_rename.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/email_and_name_rename.dart';

class Account extends StatelessWidget{ 

  
  @override
  Widget build(BuildContext context) {

    final data = context.watch<EmailNameRen>();


    return Center(
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
                      "200",
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
                      "У вас есть доступные монеты",
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
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 248, 248, 248),
                  shadowColor: Color.fromARGB(0, 255, 255, 255),
                  overlayColor: Color.fromARGB(255, 158, 158, 158),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Указываем радиус
                  ),
                  fixedSize: Size(double.infinity, 110),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: const Color.fromARGB(255, 46, 46, 46),
                      size:25,
                    ),
                    Text(
                      "Адреса",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 248, 248, 248),
                  shadowColor: Color.fromARGB(0, 255, 255, 255),
                  overlayColor: Color.fromARGB(255, 158, 158, 158),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Указываем радиус
                  ),
                  fixedSize: Size(double.infinity, 110),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.history,
                      color: const Color.fromARGB(255, 46, 46, 46),
                      size:25,
                    ),
                    Text(
                      "Заказы",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                    "6 января",
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
                    "+7 (913) 015-26-54",
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
                    borderRadius: BorderRadius.circular(20.0), // Указываем радиус
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
        Container(
          height: 100,
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 248, 248, 248),
              shadowColor: Color.fromARGB(0, 255, 255, 255),
              overlayColor: Color.fromARGB(255, 158, 158, 158),
              padding: EdgeInsets.all(20),
            ),
            onPressed: (){},
            child: Text(
              "Удалить аккаунт",
              style: TextStyle(
                color: const Color.fromARGB(255, 46, 46, 46),
              ),
            ),
          ),
        ),
      ],
    )
  );

}

}