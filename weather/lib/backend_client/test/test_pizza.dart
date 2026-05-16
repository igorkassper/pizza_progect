import 'package:weather/backend_client/give_data_pizza_backend.dart';

class Test_case_pizza{

    static Future<void> test() async {    
      
      try {
        var res = await Give_Data_Pizza.res();
        if (res["status"] == "success") {
          print("Test case 3: - success");
        } else {
          print("Test case 3: - error");
        }
      } catch (e) {
        print("Ошибка загрузки: $e");
      }
    }
  }