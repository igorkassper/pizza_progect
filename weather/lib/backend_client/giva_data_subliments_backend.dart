import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Give_Data_Subliments{

  static final String urlbase = url_main;

  static Future<Map<String, dynamic>> res(
  ) async{
    final url = Uri.parse('$urlbase/givedatasubliments');

    try{
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 201) {
        return {
          "status":"success",
          "data": responseData["data"]
        };
      }
       else {
        return {
          "status":"error",
        };
      }

    } catch(e){
        print("провал");
        print(e);
      return {
        "status":"error",
      };
    }
  }


}


