import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provid/korzinaplus.dart';
import 'package:weather/provid/data_user_provid.dart';
import 'package:weather/autification/Register.dart';
import 'autification/auth.dart';
import 'home/home.dart';



void main() {
  runApp(
    MultiProvider(  // Если провайдеров несколько
      providers: [
        ChangeNotifierProvider(create: (context) => Data_User_Provid()),
        ChangeNotifierProvider(create: (context) => KorzinaPlus()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      // home: Home(),
      home: Auth(),
    );
  }
}



