import 'package:flutter/material.dart';

class MyColor {
  String name;
  Color color;
  MyColor({required this.name, required this.color});
  static getColors() {
    return <MyColor>[
      MyColor(name: 'white', color: Colors.white),
      MyColor(name: 'yellow', color: Colors.yellow),
      MyColor(name: 'blue', color: Colors.blue),
      MyColor(name: 'red', color: Colors.red),
      MyColor(name: 'purple', color: Colors.purple),

    ];
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'name: ${this.name}, color: ${color}';
  }
}