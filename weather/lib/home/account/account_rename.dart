import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'package:weather/backend_client/rename_name.dart';


class Account_rename extends StatefulWidget{
  Account_rename({super.key});

  State<Account_rename> createState() => _Account_rename();
}

class _Account_rename extends State<Account_rename>{


  Future<void> name_rename(String name_form, var data) async{

    String id = data.user_id;

    final res = await Rename_name_back.res(id, name_form);

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
  
  @override
  Widget build(BuildContext context) {

    final name = context.watch<Data_User_Provid>();

    final TextEditingController _nameform = TextEditingController(text: "${name.name}");

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
                    "Измените имя",
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
                  controller: _nameform,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Имя",
                      labelText: 'Введите свое имя',
                    ),
                  ),
                )
              ],
            ),
          ) 
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
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
                    name_rename(_nameform.text, data);
                    context.read<Data_User_Provid>().name_ren(_nameform.text);
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




