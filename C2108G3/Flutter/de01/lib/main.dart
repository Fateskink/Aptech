import 'package:de01/screens/product/insert.dart';
import 'package:de01/screens/views/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //home: HomeScreen(),
      home: InsertProductScreen()
    );
  }
}

