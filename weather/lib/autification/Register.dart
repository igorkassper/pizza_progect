import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

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


class Register extends StatefulWidget{
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

var phoneFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: { "#": RegExp(r'[0-9]') },
);


class _Register extends State<Register>{
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
          "Register",
          style:TextStyle(
            color: Colors.white,
            fontSize: 18
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 223, 48, 47),
      ),
      body: Center(
        child: Form(
            key: _fornKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, right: 16, left: 16),
                  width: 350,
                  child: TextFormField(
                    inputFormatters: [phoneFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone),
                      hintText: "+7",
                      labelText: 'Enter your number phone',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter number phone";
                      }
                       if (value.replaceAll(RegExp(r'[^0-9]'), '').length != 11) {
                        return 'Enter full number';
                      }
                      numberPhone = value;
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
                      hintText: "Password",
                      labelText: 'Enter your password',
                      icon: Icon(Icons.password),
                      
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter password";
                      }
                        if(
                          value.length < 10 || 
                          !value.contains(RegExp(r'[A-Z]')) || 
                          !value.contains(RegExp(r'[a-z]')) || 
                          !value.contains(RegExp(r'[0-9]'))
                        ){
                        return "The password must contain:\n - 10 characters or more\n - Capital letters\n - Lowercase letters\n - Numbers";
                      }
                      password = value;
                      return null;
                    },

                  ),
                ),
                Padding(padding: EdgeInsets.all(15)),
                Container(
                  alignment: Alignment.topCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: const Color.fromARGB(255, 223, 48, 47),

                    ),
                    onPressed: (){
                      if(_fornKey.currentState!.validate()){
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
                          final snackBar = SnackBar(
                            backgroundColor: Color.fromARGB(255, 223, 48, 47),
                            duration: Duration(seconds: 5),
                            content: Text("Incorrect password or login"),
                            behavior: SnackBarBehavior.floating,
                            dismissDirection: DismissDirection.none,
                            showCloseIcon: true,
                            action: SnackBarAction(
                              label: "Close", 
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