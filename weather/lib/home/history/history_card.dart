import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/order_give_provid.dart';
import 'package:weather/provid/data_user_provid.dart';
import 'package:weather/provid/data_pizza_is_db_provid.dart';

import 'package:weather/backend_client/fitbek_backend.dart';


class History_card extends StatefulWidget{
  int id_order;
  History_card({super.key, required this.id_order});

  State<History_card> createState() => _History_card();
}



class _History_card extends State<History_card>{

  bool star_bool = true;

  List stars_conf = [
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
  ];

   Future<void> _loading_data(int param, var id_order) async{

    final res = await Add_Order_back.res(param, id_order);

    if(res["status"] == "success"){

      star_bool = false;

    }
  }

  void star(int param, var id_order){
    setState(() {
      for(int i = 0; i < 5; i++){
        stars_conf[i] = Icons.star_outline;
      }
      for(int i = 0; i < param; i++){
        stars_conf[i] = Icons.star;
      }
    });
    _loading_data(param, id_order);
  }

  Widget build(BuildContext context) {

    final data_order_give = context.watch<Order_give_provid>();
    List<dynamic> data = data_order_give.order_give;


    List position_data = data[widget.id_order]["position"];


    String adress = "";
    if(data[widget.id_order]["TYPE_ORDER"] == "Самовывоз"){
      adress = data[widget.id_order]["ADRESS"];
    } else{
      adress = data[widget.id_order]["ADRESS"];
      List list_adress = adress.split(",");
      adress = "${list_adress[0]}";
    }

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
                          "Заказ ${data[widget.id_order]["NUMBER_ORDER"].toString().padLeft(4, '0')}",
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
                        "${data[widget.id_order]["STATUS_ORDER"]}",
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
                        "${data[widget.id_order]["STATUS_OPLATA"]}",
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
                      "${data[widget.id_order]["TYPE_ORDER"]}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Text(
                    "${adress}, Новосибирск",
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
                  Column(
                    children: 
                      List.generate(
                        position_data.length, 
                        (index){

                          var data_pizza = Provider.of<Data_Pizza>(context).data_pizza;

                          int image_int = position_data[index]["ID_PIZZA"];

                          print(position_data[index]);

                          return Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child:  Row(
                              children: [
                                Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage("assets/img/pizza_cards/${data_pizza[image_int]["ID"]}.jpg"),
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
                                        "${data_pizza[image_int]["NAME"]}",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 46, 46, 46),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "${position_data[index]["SIZE"]} см, ${position_data[index]["TYPE_TESTO"]}\nдобавки (${position_data[index]["dops"].length})",
                                        style: TextStyle(
                                          color: const Color.fromARGB(255, 46, 46, 46),
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Text(
                                            "${(position_data[index]["COST"]).truncate()} ₽",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 46, 46, 46),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "x${position_data[index]["COUNT"]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 46, 46, 46),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      )
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    child: Text(
                      "Итог: ${data[widget.id_order]["COST"]} ₽",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    )
                  ),
                  Container(
                    child: Text(
                      "Начисленно: ${data[widget.id_order]["COINS"]} GodCoins",
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
                          star(1, data[widget.id_order]["ID"]);
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
                          star(2, data[widget.id_order]["ID"]);
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
                          star(3, data[widget.id_order]["ID"]);
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
                          star(4, data[widget.id_order]["ID"]);
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
                          star(5, data[widget.id_order]["ID"]);
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