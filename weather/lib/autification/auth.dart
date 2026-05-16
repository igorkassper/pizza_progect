import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:weather/autification/register.dart';

import 'package:weather/backend_client/auth_backend.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'cms_message.dart';
import 'bring_password.dart';


class Auth extends StatefulWidget{
  const Auth({super.key});

  @override
  State<Auth> createState() => _Auth();
}


// маска формата номера телефона
final phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]') },
);


class _Auth extends State<Auth>{
  final _fornKey = GlobalKey<FormState>();

  String numberPhone = "";
  String password = "";

  Future<void> auth_post() async{
    final res = await Auth_back.res(numberPhone, password);

    if(res["status"] == "success"){

      var data = res["data"];

      String id_user = data["ID"].toString();

      context.read<Data_User_Provid>().name_ren(data["NAME"]);
      context.read<Data_User_Provid>().email_ren(data["EMAIL"]);
      context.read<Data_User_Provid>().date_birth_ren(data["DATE"]);
      context.read<Data_User_Provid>().phone_ren(data["PHONE"]);
      context.read<Data_User_Provid>().user_id_ren(id_user);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
            return Cms();
          }
        )
      );
    } else if(res["status"] == "no_user"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Неверный логин или пароль')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Проверьте подключение к инету')),
      );
    }
  }

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
                            return Bring_Pass();
                          }
                        )
                      );
                    }, 
                    child: Text(
                      "Не помню пароль",
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
                        auth_post();
                      }
                    },
                    child:Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Войти",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),
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
                Padding(padding: EdgeInsets.all(30))
              ],
            )
          ),
      ),
    );
  }
  
}