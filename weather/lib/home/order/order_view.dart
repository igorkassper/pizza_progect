import 'package:flutter/material.dart';



class SimpleDatePickerTextField extends StatefulWidget {
  @override
  _SimpleDatePickerTextFieldState createState() => _SimpleDatePickerTextFieldState();
}


Color color_nocheck_but = Color.fromARGB(255, 243, 243, 247);
Color color_check_but = Color.fromARGB(255, 255, 255, 255);




class _SimpleDatePickerTextFieldState extends State<SimpleDatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  
  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
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
          '${pickedDate.day.toString().padLeft(2, '0')}.'
          '${pickedDate.month.toString().padLeft(2, '0')}.'
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
      '${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}';
      
      setState(() {
        _timeController.text = formattedTime;
      });
    }
  }

  List<Color> testo_check = [
    color_check_but,
    color_nocheck_but,
  ];


  void testo(int index){
    setState(() {
      for(int i = 0; i < testo_check.length; i++){
        testo_check[i] = color_nocheck_but;
      }
      testo_check[index] = color_check_but;
    });
  }

  String? selectedValue;
  List<String> items = ['Новосибирск', 'Красноярск', 'Москва', 'Санкт Питербург'];

  final _fornKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
          bottom: TabBar(
              // радиус при наведении
              splashBorderRadius: BorderRadius.circular(10),
              labelStyle:TextStyle(
                fontSize: 16,
              ),
              dividerHeight: 0,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  // icon: Icon(Icons.local_pizza,),
                  text: "Самовывоз",
                ),
                Tab(
                  // icon: Icon(Icons.account_circle),
                  text: "Доставка",
                )
              ]
            ),
        ),
        body: TabBarView(
            children: [
              Center(
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
                                  "Back",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                ),
                              ],
                            ) 
                          ),
                          
                          TextField(
                            controller: _dateController,
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
                            controller: _timeController,
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
                          Theme(
                            data: Theme.of(context).copyWith(
                              buttonTheme: ButtonThemeData(
                                buttonColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                              ),
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                            ),
                            child: DropdownButton<String>(
                              value: selectedValue,
                              hint: Text('Выберите город'),
                              isExpanded: true, 
                              borderRadius: BorderRadius.circular(20), 
                              items: items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              dropdownColor: Colors.white
                            )
                          ),
                          Form(
                            key: _fornKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Улица, дом",
                                      labelText: 'Название улицы или дома',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите название улицы или дома";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Подъзд",
                                      labelText: 'Номер подъезда',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер подъезда";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Этаж",
                                      labelText: 'Номер этажа',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер этажа";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Кв, Офис",
                                      labelText: 'Название квартиры или офиса',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите название квартиры или офиса";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Домофон",
                                      labelText: 'Номер домофона',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер домофона";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                            padding: EdgeInsets.all(7),
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
                                      testo(1);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: testo_check[1],
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
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
                                  "Back",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 48, 48, 48),
                                  ),
                                ),
                              ],
                            ) 
                          ),
                          TextField(
                            controller: _dateController,
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
                            controller: _timeController,
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
                          Theme(
                            data: Theme.of(context).copyWith(
                              buttonTheme: ButtonThemeData(
                                buttonColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                              ),
                              splashFactory: NoSplash.splashFactory,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                            ),
                            child: DropdownButton<String>(
                              value: selectedValue,
                              hint: Text('Выберите город'),
                              isExpanded: true, 
                              borderRadius: BorderRadius.circular(20), 
                              items: items.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              dropdownColor: Colors.white
                            )
                          ),
                          Form(
                            key: _fornKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Улица, дом",
                                      labelText: 'Название улицы или дома',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите название улицы или дома";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Подъзд",
                                      labelText: 'Номер подъезда',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер подъезда";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Этаж",
                                      labelText: 'Номер этажа',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер этажа";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Кв, Офис",
                                      labelText: 'Название квартиры или офиса',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите название квартиры или офиса";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 30)),
                                Container(
                                  alignment:Alignment.center,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Домофон",
                                      labelText: 'Номер домофона',
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Введите номер домофона";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ]
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                            padding: EdgeInsets.all(7),
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
                                      testo(1);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: testo_check[1],
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
      ),
    );
  }
}





