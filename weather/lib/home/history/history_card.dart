import 'package:flutter/material.dart';


class History_card extends StatefulWidget{
  History_card({super.key});

  State<History_card> createState() => _History_card();
}



class _History_card extends State<History_card>{


  List stars_conf = [
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
  ];

  void star(int param){
    setState(() {
      for(int i = 0; i < 5; i++){
        stars_conf[i] = Icons.star_outline;
      }
      for(int i = 0; i < param; i++){
        stars_conf[i] = Icons.star;
      }
    });
  }

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
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 243, 243, 247),
                          shadowColor: Color.fromARGB(255, 255, 255, 255),
                          overlayColor: Color.fromARGB(255, 255, 255, 255),
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
                      Container(
                        child: Text(
                          "Заказ №0001",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Text(
                      "Статус заказа",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Padding(padding: EdgeInsets.only(top: 1)),
                  Row(
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        color: const Color.fromARGB(255, 100, 100, 100),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Закрыт",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 100, 100, 100),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    color: const Color.fromARGB(255, 214, 214, 214),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.currency_ruble,
                        color: const Color.fromARGB(255, 100, 100, 100),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text(
                        "Оплачен",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 100, 100, 100),
                        ),
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Text(
                      "Самовывоз",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Text(
                    "Охотская 88, Новосибирск",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 100, 100, 100),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Text(
                      "Товары",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Row(
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
                            Text(
                              "Сырная пицца",
                              style: TextStyle(
                                color: Color.fromARGB(255, 46, 46, 46),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "30 см, Традиционный\nдобавки (3)",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 46, 46, 46),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "899 ₽",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color.fromARGB(255, 46, 46, 46),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Text(
                      "Итог: 899 ₽",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Container(
                    child: Text(
                      "Начисленно: 150 GodCoins",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          star(1);
                        },
                        icon: Icon(
                          stars_conf[0],
                          color: Colors.amber,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          overlayColor: const Color.fromARGB(0, 46, 46, 46),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          star(2);
                        },
                        icon: Icon(
                          stars_conf[1],
                          color: Colors.amber,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          overlayColor: const Color.fromARGB(0, 46, 46, 46),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          star(3);
                        },
                        icon: Icon(
                          stars_conf[2],
                          color: Colors.amber,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          overlayColor: const Color.fromARGB(0, 46, 46, 46),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          star(4);
                        },
                        icon: Icon(
                          stars_conf[3],
                          color: Colors.amber,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          overlayColor: const Color.fromARGB(0, 46, 46, 46),
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          star(5);
                        },
                        icon: Icon(
                          stars_conf[4],
                          color: Colors.amber,
                          size: 50,
                        ),
                        style: ElevatedButton.styleFrom(
                          overlayColor: const Color.fromARGB(0, 46, 46, 46),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
    );
  }

}