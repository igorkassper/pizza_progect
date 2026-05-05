import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/backend_client/giva_data_subliments_backend.dart';
import 'package:weather/provid/data_pizza_is_db_provid.dart';
import 'package:weather/provid/data_subliments_is_db_provid.dart';
import 'package:weather/provid/korzinaplus.dart';
import 'package:weather/provid/korzina.dart';


import 'package:visibility_detector/visibility_detector.dart';


class Pizza_add extends StatefulWidget{
  int user_id;
  Pizza_add({super.key, required this.user_id});

  State<Pizza_add> createState() => _Pizza_add();
}


Color color_nocheck_but = Color.fromARGB(255, 243, 243, 247);
Color color_check_but = Color.fromARGB(255, 255, 255, 255);



class _Pizza_add extends State<Pizza_add>{

    int dop_point = 0;

    bool start_val = true;


    var data;
    var data_parce_pizza;
    var data_parce;
    late int data_len;
    

    int cost = 0;
    int base_cost = 0;

    bool loading = false;

    List<Color> backblackcolor = [
      color_check_but,
      color_nocheck_but,
      color_nocheck_but,
      color_nocheck_but,
      color_nocheck_but,
      color_nocheck_but,
    ];

    List<Color> testo_check = [
      color_check_but,
      color_nocheck_but,
    ];

    List<List<dynamic>> dop_check = [
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
      [color_check_but,1],
    ];
    
    void backcolor(int index){
      setState(() {
        for(int i = 0; i < backblackcolor.length; i++){
          backblackcolor[i] = color_nocheck_but;
        }
        backblackcolor[index] = color_check_but;

        switch (index) {
          case 0:
            cost = base_cost * 1;
            break;
          case 1:
            cost = (base_cost * 1.2).toInt();
            // print("1");
            break;
          case 2:
            cost = (base_cost * 2).toInt();
            print("2");
            break;
          case 3:
            cost = (base_cost * 2.5).toInt();
            // print("3");
            break;
          case 4:
            cost = (base_cost * 3).toInt();
            // print("4");

            break;
          case 5:
            cost = (base_cost * 4).toInt();
            break;
        }

      });
    }

    

    void testo(int index){
      setState(() {
        for(int i = 0; i < testo_check.length; i++){
          testo_check[i] = color_nocheck_but;
        }
        testo_check[index] = color_check_but;
      });
    }

    void dop(int index, int status){
      setState(() {
        if(status == 0){
          if(dop_check[index][1] == 0){
            dop_check[index][0] = color_check_but;
            dop_check[index][1] = 1;
            dop_point--;
            cost -= data_parce[index]["COST"] as int;
          }
        } else{
          if(dop_point == 3){
          } else{
            dop_check[index][0] = color_nocheck_but;
            dop_check[index][1] = 0;
            dop_point++;
            cost += data_parce[index]["COST"] as int;
          }
        }
      });
    }


    Future<void> _loadSublimentsData() async {    
      try {
        var res = await Give_Data_Subliments.res();
        
        if (res["status"] == "success") {
          List<dynamic> data = res["data"] as List<dynamic>;
          context.read<Data_Subliments>().data_ren(data);
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
      _loadSublimentsData();
    }

    
    void set_data_pizza_inf(var context){
        data = Provider.of<Data_Subliments>(context);
        data_len = data.data_sub.length;
        data_parce = data.data_sub;

        var data_pizza = Provider.of<Data_Pizza>(context);
        data_parce_pizza = data_pizza.data_pizza;

        if(start_val){
          base_cost = data_parce_pizza[widget.user_id]["COST"];
          cost = base_cost;
          start_val = false;
        }
    }

    @override
    Widget build(BuildContext context) {
      set_data_pizza_inf(context);
      // print(data_parce);

      if(loading == false){
        return VisibilityDetector(
          key: const Key('pizza'),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleFraction > 0.5) {
              _loadSublimentsData();
            }
          },
          child:Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text("Интернета нет"),
            ),
          ) 
        );
      }

      return VisibilityDetector(
        key: const Key('pizza'),
        onVisibilityChanged: (VisibilityInfo info) {
          if (info.visibleFraction > 0.5) {
            _loadSublimentsData();
          }
        },
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
          ),
          body: ListView(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color_nocheck_but,
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
              ),
              Padding(padding:EdgeInsets.only(top: 20)),
              Image(
                fit: BoxFit.contain,
                image: AssetImage("assets/img/pizza_cards/${widget.user_id+1}.jpg",)
              ),
              Container(
                padding: EdgeInsets.only(left: 10,),
                alignment: Alignment.topLeft,
                child: Text(
                  "${data_parce_pizza[widget.user_id]["NAME"]}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 48, 48, 48),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 10),
                child: Text(
                  "${data_parce_pizza[widget.user_id]["DESCRIPTION"]}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 80, 80, 80),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:color_nocheck_but,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: (){
                            backcolor(0);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backblackcolor[0],
                            shadowColor: Color.fromARGB(0, 223, 48, 47),
                            overlayColor: Color.fromARGB(0, 84, 84, 84),
                          ),
                          child: Text(
                            "20см",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                          
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: (){
                            backcolor(1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backblackcolor[1],
                            shadowColor: Color.fromARGB(0, 223, 48, 47),
                            overlayColor: Color.fromARGB(0, 84, 84, 84),
                          ),
                          child: Text(
                            "25см",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                          
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: (){
                            backcolor(2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backblackcolor[2],
                            shadowColor: Color.fromARGB(0, 223, 48, 47),
                            overlayColor: Color.fromARGB(0, 84, 84, 84),
                          ),
                          child: Text(
                            "30см",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: (){
                            backcolor(3);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backblackcolor[3],
                            shadowColor: Color.fromARGB(0, 223, 48, 47),
                            overlayColor: Color.fromARGB(0, 84, 84, 84),
                          ),
                          child: Text(
                            "35см",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: (){
                            backcolor(4);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backblackcolor[4],
                            shadowColor: Color.fromARGB(0, 223, 48, 47),
                            overlayColor: Color.fromARGB(0, 84, 84, 84),
                          ),
                          child: Text(
                            "40см",
                            style: TextStyle(
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          child: ElevatedButton(
                            onPressed: (){
                              backcolor(5);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: backblackcolor[5],
                              shadowColor: Color.fromARGB(0, 223, 48, 47),
                              overlayColor: Color.fromARGB(0, 84, 84, 84),
                            ),
                            child: Text(
                              "50см",
                              style: TextStyle(
                                color: Color.fromARGB(255, 48, 48, 48),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ) 
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color:color_nocheck_but,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          testo(0);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: testo_check[0],
                          shadowColor: Color.fromARGB(0, 223, 48, 47),
                          overlayColor: Color.fromARGB(0, 84, 84, 84),
                          fixedSize: Size(150, double.infinity)
                        ),
                        child: Text(
                          "Традиционное",
                          style: TextStyle(
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontSize: 12,
                          ),
                        ),
                        
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          testo(1);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: testo_check[1],
                          shadowColor: Color.fromARGB(0, 223, 48, 47),
                          overlayColor: Color.fromARGB(0, 84, 84, 84),
                          fixedSize: Size(150, double.infinity)
                        ),
                        child: Text(
                          "Тонкое",
                          style: TextStyle(
                            color: Color.fromARGB(255, 48, 48, 48),
                            fontSize: 12,
                          ),
                        ),
                        
                      ),
                    ),
                  ]
                ),
              ),
              Container(
                width: 500,
                height: 500,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  padding: EdgeInsets.all(20.0),
                  childAspectRatio: 1/1,
                  children:
                  List.generate(
                    data_len, 
                    (index){
                      return Center(
                        child: GridTile(
                          child:
                          ElevatedButton(
                            onPressed: () {
                              if(dop_check[index][1] == 0){
                                dop(index, 0);             
                              } else{
                                dop(index, 1);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: dop_check[index][0],
                              shadowColor: Color.fromARGB(0, 223, 48, 47),
                              overlayColor: Color.fromARGB(0, 84, 84, 84),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0), // Указываем радиус
                              ),
                            ),
                            child: Column(
                              children: [
                                Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage("assets/img/dop/${index+1}.jpg",),
                                  width: 80,
                                  height: 80,
                                ),
                                Text(
                                  "${data_parce[index]['NAME']}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 80, 80, 80),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "${data_parce[index]['COST']}",
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 80, 80, 80),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),

                          ) 
                        ),
                      );
                    }
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: (){

              List cm_pizza = ["20", "25", "30", "35", "40", "50"];
              int increm1 = 0;
              for(var i in backblackcolor){
                if(i == color_check_but){
                  break;
                }
                increm1++;
              }
              String cm_res = cm_pizza[increm1];

              String testo_res = testo_check[0] == color_check_but ? "Традиционная" : "Тонкое";

              List dop_res = [];
              int increm2 = 0;
              for(var i in dop_check){
                if(i[1] == 0){
                  dop_res.add(increm2);
                }
                increm2++;
              }

              Map<String, dynamic> data_res = {
                "id_pizza": widget.user_id,
                "cm": cm_res,
                "testo": testo_res,
                "dops": dop_res,
                "cost": cost,
                "count": 1
              };

              context.read<Korzina>().add_korzina(data_res);

              context.read<KorzinaPlus>().increment();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 223, 48, 47),
              fixedSize: Size(250, 40),
            ),
            child: Text(
              "В корзину за ${cost}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      )
      );
    }
}