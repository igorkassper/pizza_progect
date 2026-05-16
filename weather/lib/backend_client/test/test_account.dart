import 'package:weather/backend_client/give_data_account_backend.dart';

class Test_case_account{

  static Future<void> test() async {    
    
    try {
      String user_id = "3";
      var res = await Give_data_accoun_back.res(user_id);
      if (res["status"] == "success") {
        print("Test case 5: - success");
      } else {
        print("Test case 5: - error");
      }
    } catch (e) {
      print("Ошибка загрузки: $e");
    }
  }
}