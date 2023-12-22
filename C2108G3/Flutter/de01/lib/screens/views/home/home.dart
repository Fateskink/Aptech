
import 'package:de01/screens/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.2*screenHeight,),
            MyButton(
                title: 'Add new product',
                onPress: (){
                  print('press');
            }),
            SizedBox(height: 0.2*screenHeight,),
            MyButton(
                title: 'Show all products',
                onPress: (){
                  print('press');
            }),
          ],
        ),
      ),
    );
  }
}
