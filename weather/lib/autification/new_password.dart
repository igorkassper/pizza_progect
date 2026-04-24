import 'package:flutter/material.dart';
// библиотека для создания масок ввода данных
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:weather/autification/ok_bring_password.dart';

import 'package:weather/provid/data_user_provid.dart';

import 'package:weather/backend_client/new_password_backend.dart';


class New_password extends StatefulWidget{
  const New_password({super.key});

  @override
  State<New_password> createState() => _New_password();
}

// маска формата для даты рождении
final dateFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
);

class _New_password extends State<New_password>{
  final _fornKey = GlobalKey<FormState>();

  String password = "";

  Future<void> new_password_post() async{

    String user_id = context.read<Data_User_Provid>().user_id;
    final res = await New_password_back.res(user_id, password);

    if(res["status"] == "success"){

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
            return Ok_bring_password();
          }
        )
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('все заебись')),
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
          "Смена пароля",
          style:TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 223, 48, 47),
      ),
      body: Center(
        // форма
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
            key: _fornKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(),
                      hintText: "Пароль",
                      labelText: 'Введите свой пароль повторно',
                      icon: Icon(Icons.password),
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Введите пароль повторно";
                      }
                        if(
                          value.length < 10 || 
                          !value.contains(RegExp(r'[A-Z]')) || 
                          !value.contains(RegExp(r'[a-z]')) || 
                          !value.contains(RegExp(r'[0-9]'))
                        ){
                        return "Пароль должен содержать:\n - 10 символов или более\n - Заглавные буквы\n - Строчные буквы\n - Цифры";
                      }
                      if(password != value){
                        return "Пароли не совпадают";
                      }
                      return null;
                    },
                  ),
                ),
                // кнопка для отправки данных
                Padding(padding: EdgeInsets.all(5)),
                Container(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 48, 47),
                    ),
                    onPressed: (){
                      if(_fornKey.currentState!.validate()){
                        new_password_post();
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