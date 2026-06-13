import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/backend_client/give_data_pizza_backend.dart';
import 'package:weather/provid/data_subliments_is_db_provid.dart';
import 'package:weather/provid/korzina.dart';
import 'package:weather/provid/korzinaplus.dart';
import 'package:weather/provid/data_user_provid.dart';
import 'package:weather/provid/data_pizza_is_db_provid.dart';
import 'package:weather/autification/Register.dart';
import 'package:weather/provid/order_give_provid.dart';
import 'autification/auth.dart';
import 'home/home.dart';

import 'package:weather/provid/reset_provid.dart';


void main() {
  runApp(
    // Сначала создаем провайдер для сброса (один, который не будет очищаться)
    ChangeNotifierProvider(
      create: (context) => Resetprovider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Resetprovider>(
      builder: (context, appReset, child) {
        // MultiProvider ВНУТРИ Consumer, чтобы пересоздаваться при смене ключа
        return MultiProvider(
          key: ValueKey(appReset.resetKey),
          providers: [
            // Все провайдеры, которые нужно очищать при выходе
            ChangeNotifierProvider(create: (context) => Data_User_Provid()),
            ChangeNotifierProvider(create: (context) => KorzinaPlus()),
            ChangeNotifierProvider(create: (context) => Data_Pizza()),
            ChangeNotifierProvider(create: (context) => Data_Subliments()),
            ChangeNotifierProvider(create: (context) => Korzina()),
            ChangeNotifierProvider(create: (context) => Order_give_provid()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            home: Auth(),
          ),
        );
      },
    );
  }
}



