
import 'package:api_flutter/2get_api.dart';
import 'package:api_flutter/3_get_api.dart';
import 'package:api_flutter/4_login_post_api.dart';
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
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home:DemoLoginInsta(),
    );
  }
}
