import 'package:flutter/material.dart';
import 'package:weather/home/order/order_view.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/korzina.dart';
import 'package:weather/provid/data_pizza_is_db_provid.dart';
import 'package:weather/provid/korzinaplus.dart';



class Order extends StatefulWidget {
  Order({super.key});


  State<Order> createState() => _Order();
}



class _Order extends State<Order> {

  @override
  Widget build(BuildContext context) {

    var data = context.watch<Korzina>().data_pizza;
    var data_pizza = context.watch<Data_Pizza>().data_pizza;

    int len_data = data.length;

    int sum = 0;
    for(var element in data){
      sum += (element["cost"] as int) * (element["count"] as int);
    }


    final screenWidth = MediaQuery.of(context).size.width;

    late double text_button_zakaz_ofrm;

    if(screenWidth <= 310){
      text_button_zakaz_ofrm = 14;
    } else{
      text_button_zakaz_ofrm = 16;
    }


    if(len_data == 0){
      return Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              fit: BoxFit.contain,
              image: AssetImage("assets/img/korzina_pusta_icon.png"),
              width: 120,
              height: 120,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Корзина пуста",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ) 
      );
    }
    
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: ListView(
            padding:EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120),
            children:
            List.generate(len_data, (index){
              return Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Image(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/img/pizza_cards/${data[index]["id_pizza"]+1}.png"),
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${data_pizza[data[index]["id_pizza"]]["NAME"]}",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 46, 46, 46),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<Korzina>().delete(index);
                                  context.read<KorzinaPlus>().deincrement();

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 243, 243, 247),
                                  shadowColor: Color.fromARGB(255, 255, 255, 255),
                                  overlayColor: Color.fromARGB(255, 255, 255, 255),
                                  minimumSize: Size.zero,
                                  fixedSize: Size(30, 30),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.compact,
                                ),
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${data[index]["cm"]} см, ${data[index]["testo"]}\nдобавки (${(data[index]["dops"]).length})",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 46, 46, 46),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${data[index]["cost"]*data[index]["count"]} ₽",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 46, 46, 46),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: (){
                                      context.read<Korzina>().plus(index);
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 243, 243, 247),
                                      shadowColor: Color.fromARGB(255, 255, 255, 255),
                                      overlayColor: Color.fromARGB(255, 255, 255, 255),
                                      minimumSize: Size.zero,
                                      fixedSize: Size(30, 30),
                                      alignment: Alignment.center ,
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 48, 48, 48),
                                      size: 15
                                    )
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text("${data[index]["count"]}"),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  ElevatedButton(
                                    onPressed: (){
                                      if(data[index]["count"] > 1){
                                        context.read<Korzina>().minus(index);
                                      }
                                    }, 
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 243, 243, 247),
                                      shadowColor: Color.fromARGB(255, 255, 255, 255),
                                      overlayColor: Color.fromARGB(255, 255, 255, 255),
                                      minimumSize: Size.zero,
                                      fixedSize: Size(30, 30),
                                      alignment: Alignment.center ,
                                      padding: EdgeInsets.zero,
                                      visualDensity: VisualDensity.compact,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Color.fromARGB(255, 48, 48, 48),
                                      size: 15
                                    )
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(230, 255, 255, 255),
            height: 130,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Сумма заказа",
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text(
                      "${sum} ₽",
                      style:TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                ElevatedButton(
                  onPressed: (){
                    
                    context.read<Korzina>().sum_ren(sum.toString());

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SimpleDatePickerTextField();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 223, 48, 47),
                    shadowColor: Color.fromARGB(255, 255, 255, 255),
                    overlayColor: Color.fromARGB(255, 255, 255, 255),
                    minimumSize: Size(double.infinity, 0)
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Перейти к оформлению",
                        style:TextStyle(
                          fontSize: text_button_zakaz_ofrm,
                          color: Colors.white,
                        )
                    ),
                  ) 
                ),
              ],
            ),
          )
        )
      ],
    );
  }  
}


