import 'package:flutter/material.dart';
import 'account/account.dart';
import 'pizza/pizza.dart';
import 'history/history.dart';
import 'order/order.dart';




Widget icon_baidge(int korzina) {
  return Stack(
    children: [
      Icon(Icons.shopping_cart,),
      Transform.translate(
        offset: Offset(15, -7),
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 16,
          height: 16,
          child: Text(
            '$korzina',
            style: TextStyle(
              color: const Color.fromARGB(255, 223, 48, 47),
              fontSize: 10,
              fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}  


class Home extends StatefulWidget{
  Home({super.key});

  State<Home> createState() => _Home();
}



class _Home extends State<Home>{

    int korzina = 0;

    void kor_update(){
      setState(
        () {
          korzina++; 
        }
      );
    }

    @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 4, 
        child: Scaffold(
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
          bottomNavigationBar: BottomAppBar(
            color: const Color.fromARGB(255, 223, 48, 47),
            child: TabBar(
              // радиус при наведении
              splashBorderRadius: BorderRadius.circular(10),
              labelStyle:TextStyle(
                fontSize: 10,
              ),
              dividerHeight: 0,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.local_pizza,),
                  text: "Пицца",
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: "История",
                ),
                Tab(
                  icon: icon_baidge(korzina),
                  text: "Корзина",
                ),
                Tab(
                  icon: Icon(Icons.account_circle),
                  text: "Аккаунт",
                )
              ]
            ),
          ),
          body: TabBarView(
            children: [
              pizza(context, kor_update),
              history(context),
              order(context),
              account(context)
            ]
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        
      );
    }
}