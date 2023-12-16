// ignore_for_file: prefer_const_constructors, unused_import

import 'package:adventure_app/pages/login.dart';
import 'package:adventure_app/pages/profile_screen.dart';
import 'package:adventure_app/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_mountain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adventure App',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
