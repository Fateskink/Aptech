import 'package:de03/models/product.dart';
import 'package:de03/repositories/color_repository.dart';
import 'package:de03/widgets/color_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> colors = <String>[];
  List<bool> isSelectedList = <bool>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final colorRepository = GetIt.instance<ColorRepository>();
    setState(() {
      colors = colorRepository.colors;
      isSelectedList = List.filled(colors.length, false);
      isSelectedList[0] = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: colors.asMap().entries.map((entry) {
                    final index = entry.key;
                    final color = entry.value;

                    return ColorButton(
                      //color: Color(int.parse(color.replaceAll('#', ''), radix: 16)),
                      color: Colors.red,
                      isSelected: isSelectedList[index],
                      onTap: (isSelected) {
                        setState(() {
                          isSelectedList = List.filled(colors.length, false);
                          isSelectedList[index] = true;
                        });
                      },
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
