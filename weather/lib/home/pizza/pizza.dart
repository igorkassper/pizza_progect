import 'package:flutter/material.dart';
import 'package:weather/home/pizza/pizza_add.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/korzinaplus.dart';




class Pizza extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: List.generate(20, (index){
          return Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 20),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/img/pizza_card.png",)
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,),
                      child: Text(
                        "Сырная пицца",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 48, 48, 48),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: Text(
                        "Сочная свиная шея в сочетании с острой говядиной, пикантной пепперони, беконом и моцареллой, заправленная фирменным томатным соусом.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 80, 80, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 20),
                          child: Text(
                            "От 899 ₽",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 46, 46, 46),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 20, right: 10),
                          child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 223, 48, 47),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                    return Pizza_add();
                                  }
                                )
                              );

                            },
                            child:Padding(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                "Выбрать",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ) 
                          ),
                        ),
                      ],
                    ),
                  ]
                )
              )
            );
          }
        ),
      ),
    );
  } 
}