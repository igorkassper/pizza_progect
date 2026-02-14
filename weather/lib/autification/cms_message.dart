import 'package:flutter/material.dart';
import '../home/home.dart';

class Cms extends StatefulWidget{
  Cms({super.key, required this.numberPhone, required this.password,});
  String numberPhone;
  String password;

  @override
  State<Cms> createState() => _Cms(numberPhone: numberPhone, password: password);
}



class _Cms extends State<Cms>{

    _Cms({required this.numberPhone, required this.password,});
    String numberPhone;
    String password;

    final _fornKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // стрелка назад на экран
          automaticallyImplyLeading: false,
          title: Text(
            "Cms",
            style:TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 223, 48, 47),
        ),
        body:Center(
          child: Form(
            key: _fornKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Enter the code\n from the cms",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 100)),
                Container(
                  width: 300,
                  alignment:Alignment.center,
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Code",
                      labelText: 'Enter your cms code',
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter cms code";
                      }
                      if(!value.contains(RegExp(r'[0-9]')) || value.length != 6){
                        return "Incorrect code";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                Container(
                  alignment:Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 48, 47),
                    ),
                    onPressed: (){
                      if(_fornKey.currentState!.validate()){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return Home();
                            }
                          )
                        );
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Отправить",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ) 
                  ),
                )
              ]
            ),
          )
            
        ),
      );
    }
}