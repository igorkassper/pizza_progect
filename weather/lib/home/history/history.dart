import 'package:flutter/material.dart';
import 'package:weather/home/history/history_card.dart';


Widget history(var context){
  return Center(
  child: ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(
            "Заказ №0001",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("Понедельник, 26 октября"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context){
                  return History_card();
                }
              )
            );
          }
        ),
      ],
    )
  );
}