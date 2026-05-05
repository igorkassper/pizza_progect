import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Korzina extends ChangeNotifier {
  List<dynamic> _data_pizza = [];
  List<dynamic> get data_pizza => _data_pizza;
  
  void add_korzina(inf) {
    _data_pizza.add(inf);
    notifyListeners(); 
  }

  void plus(index){
    _data_pizza[index]["count"] += 1;
    notifyListeners(); 
  }

  void minus(index){
    _data_pizza[index]["count"] -= 1;
    notifyListeners(); 
  }

  void delete(index){
    _data_pizza.removeAt(index);
    notifyListeners(); 
  }
}