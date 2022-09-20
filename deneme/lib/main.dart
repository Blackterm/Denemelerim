import 'package:deneme/denemeler/sms-otp/sms-otp1.dart';
import 'package:flutter/material.dart';
import 'denemeler/deneme1.dart';

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
      home: SMSOtp(),
    );
  }
}
