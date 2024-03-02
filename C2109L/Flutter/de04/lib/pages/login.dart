
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover, // This will make the image cover the whole screen
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                Text('Brand', style: TextStyle(fontSize: 40, color: Colors.white),),
                Expanded(child: Container()),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white), // Optional: Change label text color
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White underline when focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White underline when not focused
                    ),
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white), // Optional: Change label text color
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White underline when focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white), // White underline when not focused
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                    // Action to perform when the container is pressed
                  },
                  child: Container(
                    width: double.infinity, // Adjust width as needed
                    height: 50, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 10),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center, // Align text center within the container
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text('Forgot password ?', style: TextStyle(color: Colors.white, fontSize: 16),),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(child: Container(
                      height: 1, // Height of the line
                      color: Colors.white, // Color of the line
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12), // Adjust spacing between line and text
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.white), // Style of the text
                      ),
                    ),
                    Expanded(child: Container(
                      height: 1, // Height of the line
                      color: Colors.white, // Color of the line
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    // Action to perform when the container is pressed
                  },
                  child: Container(
                    width: double.infinity, // Adjust width as needed
                    height: 50, // Adjust height as needed
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8), // Adjust spacing between icon and text as needed
                        Text(
                          'Login with Facebook',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.center, // Align text center within the container
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
