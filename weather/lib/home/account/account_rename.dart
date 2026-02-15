import 'package:flutter/material.dart';

class Account_rename extends StatefulWidget{
  Account_rename({super.key});

  State<Account_rename> createState() => _Account_rename();
}

class _Account_rename extends State<Account_rename>{
  
  late final TextEditingController _nameform = TextEditingController(text: "igor");
  
  @override
  Widget build(BuildContext context) {
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
                        "Back",
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
                    "Add information",
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
                      hintText: "Name",
                      labelText: 'Enter your name',
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
                    "Cancel",
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
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 223, 48, 47),
                    fixedSize: Size(250, 40),
                  ),
                  child: Text(
                    "Change",
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




