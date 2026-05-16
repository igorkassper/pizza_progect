import 'package:weather/backend_client/register_backend.dart';

class Test_case_register{

    static Future<void> test() async {    
      
      try {
        String name = "name";
        String email = "test@mail.ru";
        String numberPhone = "+7(913)015-26-54";
        String password = "12345";
        String dateBirn = "01/02/2006";
        var res = await Register_back.res(name, email, numberPhone, password, dateBirn);
        if (res["status"] == "success") {
          print("Test case 1: - success");
        } else {
          print("Test case 1: - error");
        }
      } catch (e) {
        print("Ошибка загрузки: $e");
      }
    }
  }