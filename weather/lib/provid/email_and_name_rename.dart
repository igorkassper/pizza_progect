import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class EmailNameRen extends ChangeNotifier {
  String _name = "Игор";
  String get name => _name;

  String _email = "igorkassper@gmail.com";
  String get email => _email;
  
  void name_ren(name_rename) {
    _name = name_rename;
    notifyListeners(); 
  }

  void email_ren(email_rename) {
    _email = email_rename;
    notifyListeners(); 
  }
}