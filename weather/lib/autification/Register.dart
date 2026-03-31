import 'package:flutter/material.dart';
// библиотека для создания масок ввода данных
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:weather/autification/auth.dart';

import 'cms_message.dart';


//
// файл для регистрации пользователя
//

// для проверки из файла json в базе данных. база будет переписана потом на другую технологию
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




class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}


// маска формата номера телефона
var phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]') },
);

// маска формата для даты рождении
final dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
);

class _Register extends State<Register>{
  final _fornKey = GlobalKey<FormState>();

  String numberPhone = "";
  String password = "";
  String name = "";
  String email = "";
  String dateBirn = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Регистрация",
          style:TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 223, 48, 47),
      ),
      body: Center(
        // форма
        child: ListView(
          children: [
            Form(
            key: _fornKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100, bottom: 20, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.account_circle_outlined),
                      hintText: "Имя",
                      labelText: 'Введите свое имя',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите имя";
                      }
                      if(value.length < 2 || value.length > 50){
                        return "Длина имени от 2 до 50 символов";
                      }
                      name = value;
                      return null;
                    },
                  ),
                ),
                 Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.email_outlined),
                      hintText: "Email",
                      labelText: 'Введите свой Email',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите свой Email";
                      }
                      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Неверный Email';
                      }
                      email = value;
                      return null;
                    },
                  ),
                ),
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
                      labelText: 'Ввидите номер телефона',
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
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
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
                  padding: EdgeInsets.only(top: 20, bottom: 15, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    inputFormatters: [dateFormatter],
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      hintText: "dd/mm/yyyy",
                      labelText: 'Введите дату рождения',
                      icon: Icon(Icons.date_range),
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите дату рождения";
                      }
                      if (value.length != 10) {
                        return 'Введите полную дату';
                      }

                      try {
                        final parts = value.split('/');
                        final day = int.parse(parts[0]);
                        final month = int.parse(parts[1]);
                        final year = int.parse(parts[2]);
                        
                        if (day < 1 || day > 31) {
                          return 'Некорректный день';
                        }
                        if (month < 1 || month > 12) {
                          return 'Некорректный месяц';
                        }
                        if (year < 1900 || year > DateTime.now().year) {
                          return 'Некорректный год';
                        }
                        
                        final date = DateTime(year, month, day);
                        if (date.day != day || date.month != month) {
                          return 'такой даты не существует';
                        }
                      } catch (e) {
                        return 'Неверная дата';
                      }

                      dateBirn = value;
                      return null;
                    },
                  ),
                ),
                // кнопка для отправки данных
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
                            return Auth();
                          }
                        )
                      );
                    }, 
                    child: Text(
                      "Уже есть аккаунт?",
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline
                      ),
                    )
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
                Container(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 48, 47),
                    ),
                    onPressed: (){
                      // проверка данных и переход на экран с cmc сообщением
                      if(_fornKey.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return Cms(numberPhone: numberPhone, password: password);
                              }
                            )
                          );
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
        ],
      )  
      ),
    );
  }
  
}