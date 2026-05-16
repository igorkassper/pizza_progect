import 'package:weather/backend_client/auth_backend.dart';

class Test_case_auth{

  static Future<void> test() async {    
    try {
      String numberPhone = "+7(913)015-26-54";
      String password = "12345";
      var res = await Auth_back.res(numberPhone, password);
      if (res["status"] == "success") {
        print("Test case 2: - success");
      } else {
        print("Test case 2: - error");
      }
    } catch (e) {
      print("Ошибка загрузки: $e");
    }
  }
}