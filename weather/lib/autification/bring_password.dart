import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'cms_message_password.dart';
import 'package:weather/backend_client/bring_password_backend.dart';




class Bring_Pass extends StatefulWidget{
  const Bring_Pass({super.key});

  @override
  State<Bring_Pass> createState() => _Bring_Pass();
}


// маска формата номера телефона
var phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]') },
);


class _Bring_Pass extends State<Bring_Pass>{
  final _fornKey = GlobalKey<FormState>();

  String numberPhone = "";

  Future<void> bring_password_post() async{
    final res = await Bring_password_back.res(numberPhone);

    if(res["status"] == "success"){

      String user_id = res["user_id"].toString();

      context.read<Data_User_Provid>().user_id_ren(user_id);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context){
            return Cms_Message_Pas();
          }
        )
      );
    } else if(res["status"] == "no_user"){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Нет аккаунта с таким номером')),
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
        child: Form(
            key: _fornKey,
            child: SingleChildScrollView(
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
                  Container(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 223, 48, 47),
                      ),
                      onPressed: (){
                        if(_fornKey.currentState!.validate()){
                          bring_password_post();
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
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 243, 243, 247),
                      shadowColor: Color.fromARGB(255, 255, 255, 255),
                      overlayColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child:Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.keyboard_arrow_left,
                            color: Color.fromARGB(255, 48, 48, 48),
                          ),
                          Text(
                            "  Назад  ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                              fontSize: 17
                            ),
                          ),
                        ],
                      ),
                    ) 
                  ),
                  Padding(padding: EdgeInsets.all(30))
                ],
              ),
            )
          ),
        )
    );
  }
  
}