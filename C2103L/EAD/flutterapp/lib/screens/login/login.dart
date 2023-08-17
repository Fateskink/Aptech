import 'package:flutter/material.dart';
import 'package:flutterapp/constants/app_font_sizes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
                ),
              )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.red
                  ),
                ),
                SizedBox(height: 200,),
                Text('Email address:'.toUpperCase(), style: TextStyle(fontSize: 15, color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}
