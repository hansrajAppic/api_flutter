import 'package:api_flutter/Betalogin.dart';
import 'package:api_flutter/ResetPasswordVC.dart';
import 'package:api_flutter/staday_a_.dart';
import 'package:flutter/material.dart';

import '1_get_api_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RestPsword(),
    );
  }
}

var hemraj = 0;
