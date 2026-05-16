import 'package:weather/backend_client/test/test_account.dart';
import 'package:weather/backend_client/test/test_pizza.dart';
import 'package:weather/backend_client/test/test_data_sub.dart';
import 'package:weather/backend_client/test/test_auth.dart';
import 'package:weather/backend_client/test/test_register.dart';


void main() {
  Test_case_register.test();
  Test_case_auth.test();
  Test_case_pizza.test();
  Test_case_sub.test();
  Test_case_account.test();
}

