import 'package:flutter/material.dart';
import 'package:gano_hesaplama/PL/Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GANO Hesapla',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: "QuickSand"),
      home: HomePage(),
    );
  }
}
