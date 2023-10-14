import 'package:de01/models/my_color.dart';
import 'package:de01/models/product.dart';
import 'package:de01/repositories/product_repository.dart';
import 'package:de01/utilities/utilities.dart';
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

  List<MyColor> colors = <MyColor>[
    MyColor(name: 'white', hexValue: 0xFFFFFFFF),
    MyColor(name: 'purple', hexValue: 0xFF800080),
    MyColor(name: 'blue', hexValue: 0xFF0000FF),
    MyColor(name: 'cyan', hexValue: 0xFF00FFFF),
    MyColor(name: 'red', hexValue: 0xFFFF0000),
    MyColor(name: 'yellow', hexValue: 0xFFFFFF00),
    MyColor(name: 'orange', hexValue: 0xFFFFA500),
  ];
  //this is a state
  MyColor selectedColor = MyColor(name: 'white', hexValue: 0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final productRepository = GetIt.instance<ProductRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: colors == null || colors.length == 0 ? CircularProgressIndicator() : Column(
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
                Expanded(
                  child: DropdownButton<MyColor>(
                    value: selectedColor,
                    onChanged: (MyColor? newColor) {
                      setState(() {
                        selectedColor = newColor ?? colors.first;
                      });
                    },
                    items: colors.map<DropdownMenuItem<MyColor>>((MyColor myColor) {
                      return DropdownMenuItem<MyColor>(
                        value: myColor,
                        child: Text(myColor.name),
                      );
                    }).toList(),
                  ),
                ),
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
            onTap: () {
              print('Save');
              String productName = _nameTextEditingController.text ?? "";
              String color = _colorTextEditingController.text ?? "";
              double price = double.parse(_priceTextEditingController.text);
              if(productName.isEmpty || color.isEmpty || price < 0) {
                Utilities.alert(context, "You must enter product's name, price, color");
                return;
              }
              Product product = Product(
                  code: color,
                  name: productName,
                  hexValue: selectedColor.hexValue,
                  price: price
              );
              productRepository.addProduct(product);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      ),
    );
  }
}
