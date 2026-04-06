import 'package:flutter/material.dart';
// библиотека для создания масок ввода данных
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather/autification/register.dart';

import 'cms_message.dart';


Future<bool> readJsonFile(String password, String numberPhone) async {
  final contents = await rootBundle.loadString('assets/db/users.json');
  final data = jsonDecode(contents);
  bool availability = false;

  for(var obj in data["users"]){
    if(obj["tel"] == numberPhone && obj["password"] == password){
      availability = true;
    }
  }
  return availability;

}

class Auth extends StatefulWidget{
  const Auth({super.key});

  @override
  State<Auth> createState() => _Auth();
}


// маска формата номера телефона
var phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]') },
);


class _Auth extends State<Auth>{
  final _fornKey = GlobalKey<FormState>();

  String numberPhone = "";
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Авторизация",
          style:TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 223, 48, 47),
      ),
      body: Center(
        // форма
        child: Form(
            key: _fornKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ввод номера телефона
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    inputFormatters: [phoneFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: "+7",
                      labelText: 'Введите свой номер телефона',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите номер телефона";
                      }
                       if (value.replaceAll(RegExp(r'[^0-9]'), '').length != 11) {
                        return 'Введите полный номер';
                      }
                      numberPhone = value;
                      return null;
                    },

                  ),
                ),
                // ввод номера пароля
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 15, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      hintText: "Пароль",
                      labelText: 'Введите свой пароль',
                      icon: Icon(Icons.password),
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите пароль";
                      }
                        if(
                          value.length < 10 || 
                          !value.contains(RegExp(r'[A-Z]')) || 
                          !value.contains(RegExp(r'[a-z]')) || 
                          !value.contains(RegExp(r'[0-9]'))
                        ){
                        return "Пароль должен содержать:\n - 10 символов или более\n - Заглавные буквы\n - Строчные буквы\n - Цифры";
                      }
                      password = value;
                      return null;
                    },

                  ),
                ),
                Container(
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                      shadowColor: const Color.fromARGB(0, 255, 255, 255),
                      overlayColor: const Color.fromARGB(0, 255, 255, 255),
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            return Register();
                          }
                        )
                      );
                    }, 
                    child: Text(
                      "Еще нет аккаунта?",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline
                      ),
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                // кнопка для отправки данных
                Container(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 48, 47),
                    ),
                    onPressed: (){
                      // проверка данных и переход на экран с cmc сообщением
                      if(_fornKey.currentState!.validate()){
                        // проверка в базе данных есть ли наш пользователь
                        readJsonFile(password, numberPhone).then((value) {
                        if(value){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return Cms(numberPhone: numberPhone, password: password);
                              }
                            )
                          );
                        } else{
                          // в случае если пользователя нет или неправильны данные вызывется сообщени
                          final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 223, 48, 47),
                            duration: Duration(seconds: 5),
                            content: Text("Неверный пароль или логин"),
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.none,
                            showCloseIcon: true,
                            action: SnackBarAction(
                              label: "Закрыть", 
                              onPressed: (){

                              }
                            ),
                          );
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        });
                      }
                    },
                    child:Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Отправить",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(30))
              ],
            )
          ),
      ),
    );
  }
  
}