import 'package:flutter/material.dart';
import 'package:weather/home/order/order_change.dart';



Widget order(var context){
  return Center(
    child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Container(
                height: 200,
                child:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image(
                              fit: BoxFit.contain,
                              image: AssetImage("assets/img/pizza_card.png",),
                              width: 90,
                              height: 90,
                            ),
                            Padding(padding: EdgeInsets.only(left: 35)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Cheese pizza",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 46, 46, 46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "30 см, Tradition",
                                  // textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 46, 46, 46),
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                
                              ],
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.only(left: 25)),
                            Text(
                              "899 ₽",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 46, 46, 46),
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 95)),
                            ElevatedButton(
                              onPressed: (){}, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 243, 243, 247),
                                shadowColor: Color.fromARGB(255, 255, 255, 255),
                                overlayColor: Color.fromARGB(255, 255, 255, 255),
                                minimumSize: Size.zero,
                                fixedSize: Size(30, 30),
                                alignment: Alignment.center ,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 48, 48, 48),
                                size: 15
                              )
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text("1"),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            ElevatedButton(
                              onPressed: (){}, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 243, 243, 247),
                                shadowColor: Color.fromARGB(255, 255, 255, 255),
                                overlayColor: Color.fromARGB(255, 255, 255, 255),
                                minimumSize: Size.zero,
                                fixedSize: Size(30, 30),
                                alignment: Alignment.center ,
                                padding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Color.fromARGB(255, 48, 48, 48),
                                size: 15
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context){
                              return Order_change();
                            }
                          )
                        );
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 243, 243, 247),
                        shadowColor: Color.fromARGB(255, 255, 255, 255),
                        overlayColor: Color.fromARGB(255, 255, 255, 255),
                        minimumSize: Size.zero,
                        fixedSize: Size(30, 30),
                        alignment: Alignment.center ,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Color.fromARGB(255, 48, 48, 48),
                        size: 15
                      )
                    ),
                  ],
                )
                
              )
            ],
          )
  );


}
