import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class New_password_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    String user_id,
    String password,
  ) async{
    final url = Uri.parse('$urlbase/newpassword');

    final body = jsonEncode({
      'user_id': user_id,
      'password': password
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
          "status":"success"
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


