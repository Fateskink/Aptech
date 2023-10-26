import 'package:flutter/material.dart';

class Product {
  final String name;
  final String url;
  final double price;
  final Color color; // Added field
  Product({
    required this.name,
    required this.url,
    required this.price,
    required this.color, // Added parameter
  });
}