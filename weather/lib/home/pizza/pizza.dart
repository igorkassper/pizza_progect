import 'package:flutter/material.dart';
import 'package:weather/home/pizza/pizza_add.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/korzinaplus.dart';
import 'package:weather/provid/data_pizza_is_db_provid.dart';
import 'package:weather/backend_client/give_data_pizza_backend.dart';

import 'package:visibility_detector/visibility_detector.dart';

class Pizza extends StatefulWidget { 
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _Pizza();
}


class _Pizza extends State<Pizza> {

  bool loading = false;

  Future<void> _loadPizzaData() async {    
    try {
      var res = await Give_Data_Pizza.res();
      
      if (res["status"] == "success") {
        List<dynamic> data = res["data"] as List<dynamic>;
        context.read<Data_Pizza>().data_ren(data);
        loading = true;
      } else {
        loading = false;
      }
    } catch (e) {
      print("Ошибка загрузки: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPizzaData();
  }

  @override
  Widget build(BuildContext context) {

    var data = context.watch<Data_Pizza>();
    int data_len = data.data_pizza.length;
    var data_parce = data.data_pizza;

    final screenWidth = MediaQuery.of(context).size.width;

    late double fontsizecost;
    late double fontsize_name;
    late double fontsize_button;

    if(screenWidth <= 300){
      fontsizecost = 16;
      fontsize_name = 16;
      fontsize_button = 13;
    } else{
      fontsizecost = 18;
      fontsize_name = 18;
      fontsize_button = 15;
    }


    if(loading == false){
      return VisibilityDetector(
        key: const Key('pizza'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction > 0.5) {
            _loadPizzaData();
          }
        },
        child: Center(
          child: Text("Интернета нет"),
        )
      );
    }

    return VisibilityDetector(
      key: const Key('pizza'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5) {
          _loadPizzaData();
        }
      },
      child: Center(
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: List.generate(data_len, (index){
          return Center(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 20),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 248, 248, 248),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/img/pizza_cards/${index+1}.png",)
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,),
                      child: Text(
                        "${data_parce[index]['NAME']}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 48, 48, 48),
                          fontWeight: FontWeight.bold,
                          fontSize: fontsize_name,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: Text(
                        "${data_parce[index]['DESCRIPTION']}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 80, 80, 80),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 20),
                          child: Text(
                            "От ${data_parce[index]['COST']} ₽",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 46, 46, 46),
                              fontWeight: FontWeight.bold,
                              fontSize: fontsizecost,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10,top: 20, right: 10),
                          child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 223, 48, 47),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context){
                                    return Pizza_add(user_id: index,);
                                  }
                                )
                              );

                            },
                            child:Padding(
                              padding: EdgeInsets.all(2),
                              child: Text(
                                "Выбрать",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fontsize_button,
                                ),
                              ),
                            ) 
                          ),
                        ),
                      ],
                    ),
                  ]
                )
              )
            );
          }
        ),
      ),
    )
    );
  } 
}