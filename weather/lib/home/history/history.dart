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
            "Order №0001",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("Thursday, 26 october"),
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
          ,
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(
            "Order №0002",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("Thursday, 26 october"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print("njnjnj");
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(
            "Order №0003",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("Thursday, 26 october"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print("njnjnj");
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(
            "Order №0004",
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text("Thursday, 26 october"),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print("njnjnj");
          },
        )
      ],
    )
  );
}