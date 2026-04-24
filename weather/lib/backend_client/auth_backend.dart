import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Auth_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    String numberPhone,
    String password,
  ) async{
    final url = Uri.parse('$urlbase/auth');

    final body = jsonEncode({
      'phone': numberPhone,
      'password': password,
    });

    try{
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        print("успех");
        return {
          "status":"success",
          "data": responseData["data"]
        };
      }
      if (response.statusCode == 401) {
        print("неверный логин или пароль");
        return {
          "status":"no_user",
        };
      }
       else {
        print("ошибка");
        return {
          "status":"error",
        };
      }

    } catch(e){
        print("провал");
        print(e);
      return {
        "status":"error_fatal",
      };
    }
  }


}


