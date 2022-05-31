import 'package:deneme/denemeler/deneme3.dart';
import 'package:deneme/denemeler/deneme4.dart';
import 'package:deneme/denemeler/deneme5.dart';
import 'package:deneme/denemeler/deneme6.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Deneme",
      debugShowCheckedModeBanner: false,
      home: OnBoardingPage(),
    );
  }
}
