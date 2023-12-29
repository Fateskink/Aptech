import 'package:de01/models/my_color.dart';
import 'package:de01/models/product.dart';
import 'package:de01/repositories/color_repository.dart';
import 'package:de01/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController _colorTextEditingController = TextEditingController();
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();

  final productRepository = GetIt.instance<ProductRepository>();
  final colorRepository = GetIt.instance<ColorRepository>();

  List<MyColor> colors = <MyColor>[];
  MyColor? selectedColor;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchColors();
  }
  void fetchColors() async {
    List<MyColor> fetchedColors = await colorRepository.fetchColors();
    setState(() {
      colors = fetchedColors;
      selectedColor = colors.isNotEmpty ? colors.first : null;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Code',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
                controller: _colorTextEditingController,
              )
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  controller: _nameTextEditingController,
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Color', style: TextStyle(fontSize: 18),),
                  SizedBox(width: 80,),
                  Expanded(child: DropdownButton<MyColor>(
                    value: selectedColor,
                    onChanged: (MyColor? newValue) {
                      setState(() {
                        selectedColor = newValue ?? colors.first;
                      });
                    },
                    items: colors.map<DropdownMenuItem<MyColor>>((MyColor color) {
                      return DropdownMenuItem<MyColor>(
                        value: color,
                        child: Text(color.name),
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Price',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                  ),
                  controller: _priceTextEditingController,
                )
            ),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple,
                ),
                child: Text('Save', style: TextStyle(fontSize: 20, color: Colors.white),),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              ),
              onTap: () async {
                print('Save');
                Product product = Product(
                    code: _colorTextEditingController.text,
                    name: _nameTextEditingController.text,
                    hexValue: selectedColor?.hexValue ?? 0,
                    price: double.parse(_priceTextEditingController.text)
                );
                await productRepository.addProduct(product);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
