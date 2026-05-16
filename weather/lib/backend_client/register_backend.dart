import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Register_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    String name,
    String email,
    String numberPhone,
    String password,
    String dateBirn
  ) async{
    final url = Uri.parse('$urlbase/register');

    final body = jsonEncode({
      'name': name,
      'email': email,
      'phone': numberPhone,
      'password': password,
      'date': dateBirn,
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
      } else if(response.statusCode == 409) {
        print("акк есть в системе");
        return {
          "status":"account",
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


