import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'account/account.dart';
import 'pizza/pizza.dart';
import 'history/history.dart';
import 'order/order.dart';
import 'package:weather/provid/korzinaplus.dart';

import 'package:weather/backend_client/give_data_account_backend.dart';
import 'package:weather/provid/data_user_provid.dart';


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

    bool loading = false;


    Future<void> _loading_data() async{

      String user_id = context.read<Data_User_Provid>().user_id;

      final res = await Give_data_accoun_back.res(user_id);

      if(res["status"] == "success"){

        var data = res["data"];
        String id_user = data["ID"].toString();
        String coins = res["coins"].toString();

        context.read<Data_User_Provid>().name_ren(data["NAME"]);
        context.read<Data_User_Provid>().email_ren(data["EMAIL"]);
        context.read<Data_User_Provid>().date_birth_ren(data["DATE"]);
        context.read<Data_User_Provid>().phone_ren(data["PHONE"]);
        context.read<Data_User_Provid>().user_id_ren(id_user);
        context.read<Data_User_Provid>().coins_ren(coins);

        set();
        
      }
    }

    void set(){
      setState((){
        loading = true;
      });
    }

    @override
    Widget build(BuildContext context) {

      final korzina = context.watch<KorzinaPlus>();
      
      _loading_data();

      final screenWidth = MediaQuery.of(context).size.width;

      late double text_button_bar;

      if(screenWidth <= 325){
        text_button_bar = 8;
      } else{
        text_button_bar = 10;
      }

      if(loading == false){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Интернета нет",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 30)),
                IconButton(
                  onPressed: (){
                    _loading_data();
                  }, 
                  icon: Icon(
                    Icons.refresh,
                    size: 50,
                  )
                )
              ],
            )
            
          ),
        );
      }
      return DefaultTabController(
        length: 4, 
        child: PopScope(
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
                  fontSize: text_button_bar,
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
                    icon: icon_baidge(korzina.count),
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
                Pizza(),
                History(),
                Order(),
                Account()
              ]
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          ),
        )
      );
    }
}