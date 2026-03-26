import 'package:flutter/material.dart';
import 'package:weather/home/home.dart';


class Order_oplata extends StatelessWidget{
  Order_oplata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 48, 47),
                borderRadius: BorderRadius.circular(100), 
              ),
              child: Center(
                child: Icon(
                  Icons.check_outlined,
                  size: 90,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "Заказ принят!",
                style: TextStyle(
                  fontSize: 30,
                )
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 223, 48, 47),
                  shadowColor: Color.fromARGB(255, 255, 255, 255),
                  overlayColor: Color.fromARGB(255, 255, 255, 255),
                ),
                child:Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "На главную",
                      style:TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )
                  ),
                ) 
              ),
            )
          ],
        ),
      ),
    );
  }
}


