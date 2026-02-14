import 'package:flutter/material.dart';
import 'package:weather/home/order/order_add.dart';


Widget pizza(var context, Function kor_update){
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
                      "Cheese pizza",
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
                      "Added juicy pork neck to spicy beef, piquant pepperoni, bacon and mozzarella with signature tomato sauce",
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
                          "At 899 ₽",
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
                          onPressed: () async {
                            // print(korzina);
                            final res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return Order_add();
                                }
                              )
                            );

                            if(res == 1){
                              kor_update();
                            }
                          },
                          child: Text(
                            "Chouce",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
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