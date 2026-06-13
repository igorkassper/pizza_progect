import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Resetprovider extends ChangeNotifier {
  int _resetKey = 0;
  
  int get resetKey => _resetKey;
  
  void logout() {
    _resetKey++;
    notifyListeners();
  }
}