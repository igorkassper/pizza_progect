import 'package:flutter/material.dart';
import 'package:weather/home/order/order_change.dart';
import 'package:weather/home/order/order_view.dart';


class Order extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
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
                                "Сырная пицца",
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
                            "30 см, Традиционное\nдобавки (3)",
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
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 80,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Сумма заказа",
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                      "99900 ₽",
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SimpleDatePickerTextField();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 223, 48, 47),
                    shadowColor: Color.fromARGB(255, 255, 255, 255),
                    overlayColor: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Перейти к оформлению",
                        style:TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        )
                    ),
                  ) 
                ),
              ],
            ),
          )
              
          
          
        )
      ],
    );
  }  
}


