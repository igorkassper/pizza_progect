import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class KorzinaPlus extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); 
  }

  void deincrement() {
    _count--;
    notifyListeners(); 
  }

  void despose_count() {
    _count = 0;
    notifyListeners(); 
  }
}