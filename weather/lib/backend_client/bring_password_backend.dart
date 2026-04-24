import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Bring_password_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    String numberPhone,
  ) async{
    final url = Uri.parse('$urlbase/bringpassword');

    final body = jsonEncode({
      'phone': numberPhone,
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
          "user_id": responseData["user_id"]
        };
      }
      if (response.statusCode == 401) {
        print("нет такого телефона");
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


