import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/korzinaplus.dart';



class Pizza_add extends StatefulWidget{
  Pizza_add({super.key});

  State<Pizza_add> createState() => _Pizza_add();
}


Color color_nocheck_but = Color.fromARGB(255, 243, 243, 247);
Color color_check_but = Color.fromARGB(255, 255, 255, 255);



class _Pizza_add extends State<Pizza_add>{

    List<Color> backblackcolor = [
      color_nocheck_but,
      color_nocheck_but,
      color_check_but,
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
          dop_check[index][0] = color_check_but;
        } else{
          dop_check[index][0] = color_nocheck_but;
        }
      });
    }

    @override
    Widget build(BuildContext context) {
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
                image: AssetImage("assets/img/pizza_card.png",)
              ),
              Container(
                padding: EdgeInsets.only(left: 10,),
                alignment: Alignment.topLeft,
                child: Text(
                  "Сырная пицца",
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
                  "Сочная свиная шея в сочетании с острой говядиной, пикантной пепперони, беконом и моцареллой, заправленная фирменным томатным соусом.",
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
                    20, 
                    (index){
                      return Center(
                        child: GridTile(
                          child:
                          ElevatedButton(
                            onPressed: () {
                              if(dop_check[index][1] == 0){
                                dop(index, 0);
                                dop_check[index][1] = 1;
                              } else{
                              dop(index, 1);
                                dop_check[index][1] = 0;
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
                                  image: AssetImage("assets/img/dop.png",),
                                  width: 80,
                                  height: 80,
                                ),
                                Text(
                                  "Ароматная говядина",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: const Color.fromARGB(255, 80, 80, 80),
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "119 ₽",
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
              context.read<KorzinaPlus>().increment();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 223, 48, 47),
              fixedSize: Size(250, 40),
            ),
            child: Text(
              "В корзину за 899",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
}