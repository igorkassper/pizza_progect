import 'package:flutter/material.dart';
import 'package:weather/home/order/order_oplata.dart';
import 'package:weather/home/order/order_view/camovivoz.dart';
import 'package:weather/home/order/order_view/delivery.dart';



class SimpleDatePickerTextField extends StatefulWidget {
  @override
  _SimpleDatePickerTextFieldState createState() => _SimpleDatePickerTextFieldState();
}


class _SimpleDatePickerTextFieldState extends State<SimpleDatePickerTextField> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
              // радиус при наведении
              splashBorderRadius: BorderRadius.circular(10),
              labelStyle:TextStyle(
                fontSize: 16,
              ),
              dividerHeight: 0,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  text: "Самовывоз",
                ),
                Tab(
                  text: "Доставка",
                )
              ]
            ),
        ),
        body: TabBarView(
            children: [
              Camovivoz(),
              Delivery()
            ]
          ),
      ),
    );
  }
}





