import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Data_Pizza extends ChangeNotifier {
  List<dynamic> _data_pizza = [];
  List<dynamic> get data_pizza => _data_pizza;

  void data_ren(data_pizza) {
    _data_pizza = data_pizza;
    notifyListeners(); 
  }
}