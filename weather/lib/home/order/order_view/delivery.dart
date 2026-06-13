import 'package:flutter/material.dart';
import 'package:weather/home/order/order_oplata.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/data_user_provid.dart';
import 'package:weather/provid/korzina.dart';

import 'package:weather/backend_client/add_order_backend.dart';
import 'package:weather/provid/korzinaplus.dart';


Color color_nocheck_but_2 = Color.fromARGB(255, 243, 243, 247);
Color color_check_but_2 = Color.fromARGB(255, 255, 255, 255);

final dateFormatter = MaskTextInputFormatter(
    mask: '##-##-####',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
);

final timeFormatter = MaskTextInputFormatter(
    mask: '##-##',
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy,
);


bool formatadress(String input) {
  final regex = RegExp(r'^(?=.*[а-яА-ЯёЁ])(?=.*[0-9])[а-яА-ЯёЁ0-9\s-]+$');
  return regex.hasMatch(input);
}

bool formatadress_all(String input) {
  final regex = RegExp(r'^\d+$');
  return regex.hasMatch(input);
}

bool formatadress_domofon(String input) {
  final regex = RegExp(r'^[а-яА-ЯёЁ0-9\s]+$');
  return regex.hasMatch(input);
}


class Delivery extends StatefulWidget {
  @override
  _Delivery createState() => _Delivery();
}

class _Delivery extends State<Delivery> {

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(255, 223, 48, 47),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (pickedDate != null) {
      String formattedDate = 
          '${pickedDate.day.toString().padLeft(2, '0')}-'
          '${pickedDate.month.toString().padLeft(2, '0')}-'
          '${pickedDate.year}';
      
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }



  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(255, 223, 48, 47),
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (pickedTime != null) {
      String formattedTime = 
      '${pickedTime.hour.toString().padLeft(2, '0')}-${pickedTime.minute.toString().padLeft(2, '0')}';
      
      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }


  List<Color> check_2 = [
    color_check_but_2,
    color_nocheck_but_2,
  ];


  void oplata_2(int index){
    setState(() {
      for(int i = 0; i < check_2.length; i++){
        check_2[i] = color_nocheck_but_2;
      }
      check_2[index] = color_check_but_2;
    });
  }


   Future<void> add_order_post(data_add_order) async{
    final res = await Add_Order_back.res(data_add_order);

    if(res["status"] == "success"){

      context.read<KorzinaPlus>().despose_count();
      context.read<Korzina>().dispose_korzina();


      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Order_oplata();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Проверьте подключение к инету')),
      );
    }
  }


  final _fornKey = GlobalKey<FormState>();


  String coins_minus = "0";

  String adress1 = "";
  String adress2 = "";
  String adress3 = "";
  String adress4 = "";
  String adress5 = "";


   @override
    Widget build(BuildContext context) {

    final data = context.watch<Data_User_Provid>();

    final sum_order = context.watch<Korzina>().sum;


      return Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 30,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 243, 243, 247),
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
                  TextField(
                    readOnly: true, 
                    controller: _dateController,
                    inputFormatters: [dateFormatter],
                    decoration: InputDecoration(
                      labelText: 'Дата',
                      hintText: 'dd.mm.yyyy',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today,),
                        onPressed: _selectDate,
                      ),
                    ),
                  ),
                  TextField(
                    readOnly: true, 
                    controller: _timeController,
                    inputFormatters: [timeFormatter],
                    decoration: InputDecoration(
                      labelText: 'Время',
                      hintText: 'hh:mm',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: _selectTime,
                      ),
                    ),
                  ),
                  Form(
                    key: _fornKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Улица, дом",
                              labelText: 'Название улицы или дома',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите название улицы или дома";
                              }
                              if(!formatadress(value)){
                                return "Не верный формат данных";
                              }
                              adress1 = value;
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Подъзд",
                              labelText: 'Номер подъезда',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите номер подъезда";
                              }
                              if(!formatadress_all(value)){
                                return "Не верный формат данных";
                              }
                              adress2 = value;
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Этаж",
                              labelText: 'Номер этажа',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите номер этажа";
                              }
                              if(!formatadress_all(value)){
                                return "Не верный формат данных";
                              }
                              adress3 = value;
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Кв, Офис",
                              labelText: 'Название квартиры или офиса',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите название квартиры или офиса";
                              }
                              if(!formatadress_all(value)){
                                return "Не верный формат данных";
                              }
                              adress4 = value;
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Домофон",
                              labelText: 'Номер домофона',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите номер домофона";
                              }
                              if(!formatadress_domofon(value)){
                                return "Не верный формат данных";
                              }
                              adress5 = value;
                              return null;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Container(
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Используйте баллы!",
                            style: TextStyle(
                              fontSize: 15,

                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment:Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Доступно: ${data.coins}",
                              labelText: 'Введите количество баллов',
                            ),
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Введите количество баллов\nили 0 если не нужно списывать";
                              }
                              if(!RegExp(r'^\d+$').hasMatch(value)){
                                return "Не верный формат данных";
                              }
                              if(int.parse(value) > int.parse(data.coins)){
                                return "Нельзя списать баллов больше";
                              }
                              if(int.parse(value) > int.parse(sum_order)){
                                return "Нельзя списать баллов больше чем сумма заказа";
                              }
                              coins_minus = value;
                              return null;
                            },
                          ),
                        ),
                      ]
                    ),
                  ),
                  Text(
                    "Итого: ${sum_order} руб.",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color:Color.fromARGB(255, 243, 243, 247),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              oplata_2(0);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: check_2[0],
                              shadowColor: Color.fromARGB(0, 223, 48, 47),
                              overlayColor: Color.fromARGB(0, 84, 84, 84),
                              fixedSize: Size(150, 200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                // side: BorderSide(color: const Color.fromARGB(255, 163, 163, 163), width: 2),
                              ),
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    size: 30,
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 10)),
                                  Text(
                                    "Картой при получении",
                                    textAlign:TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 48, 48, 48),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){
                              oplata_2(1);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: check_2[1],
                              shadowColor: Color.fromARGB(0, 223, 48, 47),
                              overlayColor: Color.fromARGB(0, 84, 84, 84),
                              fixedSize: Size(150, 200),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.currency_ruble,
                                    size: 30,
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                  Padding(padding: EdgeInsets.only(bottom: 10)),
                                  Text(
                                    "Наличными",
                                    textAlign:TextAlign.center,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 48, 48, 48),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10, bottom: 25),
                    child: ElevatedButton(
                      onPressed: (){
                        int status = 0;
                        if(!_fornKey.currentState!.validate() || _dateController.text == "" || _timeController.text == ""){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Поля пустые или формат данных неверный')),
                          );
                        } else {
                          try {

                            final parts = _dateController.text.split('-');
                            final day = int.parse(parts[0]);
                            final month = int.parse(parts[1]);
                            final year = int.parse(parts[2]);

                            if (
                              _dateController.text.length != 10 
                              || day < 1 || day > 31 
                              || month < 1 || month > 12 ||
                              year < DateTime.now().year
                            ) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Не верный формат даты')),
                                );
                                status = 1;
                            }
                            
                            final date = DateTime(year, month, day);
                            if (date.day != day || date.month != month) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Не верный формат даты')),
                              );
                              status = 1;
                            }

                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Не верный формат даты')),
                            );
                            status = 1;
                          }

                          try {

                            final parts2 = _timeController.text.split('-');
                            final minutes = int.parse(parts2[1]);
                            final hours = int.parse(parts2[0]);

                            if (
                              _timeController.text.length != 5
                              || minutes < 0 || minutes > 59
                            ) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Не верный формат времени')),
                              );
                              status = 1;
                            }
                            if(hours < 8 || hours > 23){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Время работы заведения с 8.00 - 23.00')),
                              );
                              status = 1;
                            }
                            
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Не верный формат времени')),
                            );
                            status = 1;
                          }
              

                          if(status == 0){

                            int res = int.parse(sum_order) - int.parse(coins_minus);
                            context.read<Korzina>().sum_ren(res.toString());

                            final data_korzina = Provider.of<Korzina>(context, listen: false);

                            String date_res = "${_dateController.text}-${_timeController.text}";

                            String oplata = "";

                            if(check_2[0] == color_check_but_2){
                              oplata = "Картой при получении";
                            } else{
                              oplata = "Наличными";
                            }

                            String address = "${adress1},${adress2},${adress3},${adress4},${adress5}";



                            Map<dynamic, dynamic> data_add_order = {
                              "id_user": data.user_id,
                              "korzina": data_korzina.data_pizza,
                              "sum_cost": data_korzina.sum,
                              "datetime": date_res,
                              "type_oplata": oplata,
                              "address": address,
                              "coins_minus": coins_minus,
                              "type_order": "Доставка"
                            };


                            add_order_post(data_add_order);

                          }
                          
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 223, 48, 47),
                        shadowColor: Color.fromARGB(255, 255, 255, 255),
                        overlayColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child:Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Оформить",
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
          ],
        ),
      );
    }

}