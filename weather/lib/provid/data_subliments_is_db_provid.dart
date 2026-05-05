import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Data_Subliments extends ChangeNotifier {
  List<dynamic> _data_sub = [];
  List<dynamic> get data_sub => _data_sub;

  void data_ren(data_sub) {
    _data_sub = data_sub;
    notifyListeners(); 
  }
}