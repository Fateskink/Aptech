import 'package:de03/models/product.dart';
import 'package:de03/repositories/color_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final colorRepository = GetIt.instance<ColorRepository>();
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 80,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                        child: Text(
                          this.widget.product.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,)
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.heart_broken),
                      ),
                    )
                  ],
                ),
              ),
              Image.network(
                this.widget.product.url,
                width: MediaQuery.of(context).size.width - 20,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
