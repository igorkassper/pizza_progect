import 'package:flutter/material.dart';


class History_card extends StatefulWidget{
  History_card({super.key});

  State<History_card> createState() => _History_card();
}



class _History_card extends State<History_card>{

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
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
        body: ListView(
          children: [
            Container(
              child: Text("jnjjnj")
            )
          ],
        )
    );
  }

}