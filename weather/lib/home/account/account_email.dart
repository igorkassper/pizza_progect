import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'package:weather/backend_client/rename_email.dart';


class Account_email extends StatefulWidget{
  Account_email({super.key});

  State<Account_email> createState() => _Account_email();
}

class _Account_email extends State<Account_email>{
  
  Future<void> email_rename(String email_form, var data) async{

    String id = data.user_id;

    final res = await Rename_email_back.res(id, email_form);

    if(res["status"] == "success"){
      Navigator.pop(context);
    } else if(res["status"] == "error"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось изменить данные')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Проверьте подключение к инету')),
      );
    }
  }

  late TextEditingController _emailform;

  @override
  Widget build(BuildContext context) {

    final email = context.read<Data_User_Provid>();

    _emailform = TextEditingController(text: "${email.email}");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image(
                      fit: BoxFit.cover,
                      height: 50,
                      image: AssetImage("assets/img/pizza.png",)
                    ),
                    Text(
                      "PizzaGod",
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                ],
              )
              
            ),
              
            backgroundColor: const Color.fromARGB(255, 223, 48, 47),
          ),
          body:Center(
            child:Padding(
              padding: EdgeInsets.all(20),
              child: Column(
              children: [
                Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 248, 248, 248),
                    shadowColor: Color.fromARGB(0, 255, 255, 255),
                    overlayColor: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: Color.fromARGB(255, 48, 48, 48),
                      ),
                      Text(
                        "Назад",
                        style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                        ),
                      ),
                    ],
                  ) 
                ),
              ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Измените Email",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 46, 46, 46),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Container(
                  // width: 250,
                  child: TextField(
                    controller: _emailform,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Email",
                      labelText: 'Введите свой Email',
                    ),
                  ),
                )
              ],
            ),
          ) 
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 100),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 231, 231, 231), // Цвет границы
                      width: 2.0,        // Толщина границы
                    ),
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Color.fromARGB(0, 255, 255, 255),
                    overlayColor: Color.fromARGB(0, 255, 255, 255),
                    fixedSize: Size(250, 40),
                  ),
                  child: Text(
                    "Отмена",
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){
                    var data = context.read<Data_User_Provid>();
                    email_rename(_emailform.text, data);
                    context.read<Data_User_Provid>().email_ren(_emailform.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 223, 48, 47),
                    fixedSize: Size(250, 40),
                  ),
                  child: Text(
                    "Поменять",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          )
          
           
        ),
    );
  }


}




