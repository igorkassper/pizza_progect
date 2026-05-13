import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Order_give_provid extends ChangeNotifier {
  List<dynamic>  _order_give = [];
  List<dynamic> get order_give => _order_give;
  
  void order_give_res(value) {
    _order_give = value;
    notifyListeners(); 
  }
}