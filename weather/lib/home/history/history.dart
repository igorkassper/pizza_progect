import 'package:flutter/material.dart';
import 'package:weather/home/history/history_card.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:weather/provid/order_give_provid.dart';
import 'package:weather/provid/data_user_provid.dart';

import 'package:weather/backend_client/give_order_backend.dart';



class History extends StatefulWidget { 
  const History({super.key});

  @override
  State<History> createState() => _History();
}



class _History extends State<History>{

  bool loading = false;

  Future<void> _loading_data() async{

    String user_id = context.read<Data_User_Provid>().user_id;

    
    final res = await Give_Order_back.res(user_id);

    if(res["status"] == "success"){

      var data = res["data"];

      context.read<Order_give_provid>().order_give_res(data);

      loading = true;
    } else{
      loading = false;
    }
  }



  @override
  void initState() {
    super.initState();
    _loading_data();
  }

  
  @override
  Widget build(BuildContext context) {

    final data_order_give = context.watch<Order_give_provid>();

    List<dynamic> data = data_order_give.order_give;

    if(loading == false){
      return VisibilityDetector(
        key: const Key('history'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction > 0.5) {
            _loading_data();
          }
        },
        child: Center(
          child: Text("Интернета нет"),
        )
      );
    }

              
    if(data.length > 0){
      return VisibilityDetector(
        key: const Key('history'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction > 0.5) {
            _loading_data();
          }
        },
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(16),
            children: 
              List.generate(
                data.length,
                (index){

                  List date_create = data[index]["DATE_CREATE"].split("-");

                  int month = int.parse(date_create[1]);
                  
                  List mas_month = ["Января", "Февраля", 
                  "Марта", "Апреля", "Мая", "Июня", 
                  "Июля", "Августа", "Сентября", "Октября", 
                  "Ноября", "Декабря"];

                  return ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text(
                      "№${data[index]["NUMBER_ORDER"].toString().padLeft(4, '0')}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text("${int.parse(date_create[2])} ${mas_month[month-1]}, ${int.parse(date_create[3])}:${int.parse(date_create[4])}"),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            return History_card(id_order: index,);
                          }
                        )
                      );
                    }
                  );
                }
              ),
            )
          )
        );
    } else{
      return VisibilityDetector(
          key: const Key('history'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.5) {
              _loading_data();
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/img/empty.png"),
                  width: 140,
                  height: 140,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "История пуста",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ) 
          )
      );
    }

    
  }
}