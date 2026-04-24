import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Data_User_Provid extends ChangeNotifier {
  String _user_id = "";
  String get user_id => _user_id;

  String _name = "";
  String get name => _name;

  String _email = "";
  String get email => _email;

  String _date_birth = "";
  String get date_birth => _date_birth;

  String _phone = "";
  String get phone => _phone;
  
  void name_ren(name_rename) {
    _name = name_rename;
    notifyListeners(); 
  }

  void email_ren(email_rename) {
    _email = email_rename;
    notifyListeners(); 
  }

  void date_birth_ren(date_birth) {
    _date_birth = date_birth;
    notifyListeners(); 
  }

  void phone_ren(phone) {
    _phone = phone;
    notifyListeners(); 
  }

  void user_id_ren(user_id) {
    _user_id = user_id;
    notifyListeners(); 
  }
}