import 'package:flutter/material.dart';
import 'package:weather/home/order/order_change.dart';


Widget order(var context) {
  return Center(
    child: ListView(
      padding: EdgeInsets.all(16),
      children: [
        Container(
          child: Row(
            children: [
              Image(
                fit: BoxFit.contain,
                image: AssetImage("assets/img/pizza_card.png"),
                width: 120,
                height: 120,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cheese pizza",
                          style: TextStyle(
                            color: Color.fromARGB(255, 46, 46, 46),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Order_change();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 243, 243, 247),
                            shadowColor: Color.fromARGB(255, 255, 255, 255),
                            overlayColor: Color.fromARGB(255, 255, 255, 255),
                            minimumSize: Size.zero,
                            fixedSize: Size(30, 30),
                            alignment: Alignment.center,
                            padding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Icon(
                            Icons.more_horiz,
                            color: Color.fromARGB(255, 48, 48, 48),
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      "30 см, Tradition\nsupplements (3)",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 46, 46),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "899 ₽",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 46, 46, 46),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          children: [
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
                        )
                        
                      ],
                    )
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}