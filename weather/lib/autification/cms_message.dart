import 'package:flutter/material.dart';
import '../home/home.dart';


class Cms extends StatefulWidget{

  @override
  State<Cms> createState() => _Cms();
}

class _Cms extends State<Cms>{

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // текст об вводе
                  Text(
                    textAlign: TextAlign.center,
                    "Введите код\n из cmc",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 100)),
                  // поле с кодом
                  Container(
                    width: 300,
                    alignment:Alignment.center,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Код",
                        labelText: 'Введите свой cmc код',
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Введите cms код";
                        }
                        if(!value.contains(RegExp(r'[0-9]')) || value.length != 6){
                          return "Неверный код";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 50)),
                  // кнопка для отправки данных
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
          )
        ),
      );
    }
}