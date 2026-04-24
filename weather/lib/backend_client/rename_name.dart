import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Rename_name_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    String user_id,
    String name,
  ) async{

    final url = Uri.parse('$urlbase/renamename');

    final body = jsonEncode({
      'user_id': user_id,
      'name': name,
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
        };
      } else {
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


