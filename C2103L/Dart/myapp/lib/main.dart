import 'dart:math';
//import 'package:flutter/material.dart';
import 'dart:io';
void bai01() {
  print('Enter an integer: ');
  int n = int.parse(stdin.readLineSync() ?? "0");
  //print('Result is :${x * x}');
  print('Result is :${pow(n, 2)}');
}
void bai02() {
  print('Enter m = ');
  int m = int.parse(stdin.readLineSync()!);
  print('Enter n = ');
  int n = int.parse(stdin.readLineSync()!);
  int sum = m + n;
  int multiply = m * n;
  print('sum = ${sum}, multiply = ${multiply}');
  print('Max value is ${max(sum, multiply)}');
}
void main() {
  //bai01();
  bai02();
  //runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: Text('Chao cacmfidfidj ban', style: TextStyle(fontSize: 30),),
        ),
      )
    );
  }
}
*/
