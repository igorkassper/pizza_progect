import 'package:flutter/material.dart';
// библиотека для создания масок ввода данных
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:weather/autification/auth.dart';
import 'cms_message.dart';

import 'package:weather/backend_client/register_backend.dart';

import 'package:weather/provid/data_user_provid.dart';



class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}


// маска формата номера телефона
final phoneFormatter = MaskTextInputFormatter(
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

  Future<void> register_post() async{
    final res = await Register_back.res(name, email, numberPhone, password, dateBirn);

    if(res["status"] == "success"){

      String user_id = res["user_id"];

      context.read<Data_User_Provid>().name_ren(name);
      context.read<Data_User_Provid>().email_ren(email);
      context.read<Data_User_Provid>().date_birth_ren(dateBirn);
      context.read<Data_User_Provid>().phone_ren(numberPhone);
      context.read<Data_User_Provid>().user_id_ren(user_id);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
            return Cms();
          }
        )
      );
    } else if(res["status"] == "error"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось создать аккаунт')),
      );
    } else if(res["status"] == "account"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Аккаунт с такими данными уже создан')),
      );
    }
      else {
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
                        register_post();
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