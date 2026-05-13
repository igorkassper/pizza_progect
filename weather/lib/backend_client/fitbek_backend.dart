import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Add_Order_back{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
    int fitbek,
    var id_order
  ) async{
    final url = Uri.parse('$urlbase/fitbek');

    final body = jsonEncode({
      'fitbek': fitbek,
      'id_order': id_order
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


