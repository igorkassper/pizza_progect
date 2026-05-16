import 'package:weather/backend_client/giva_data_subliments_backend.dart';

class Test_case_sub{

    static Future<void> test() async {    
      
      try {
        var res = await Give_Data_Subliments.res();
        if (res["status"] == "success") {
          print("Test case 4: - success");
        } else {
          print("Test case 4: - error");
        }
      } catch (e) {
        print("Ошибка загрузки: $e");
      }
    }
  }