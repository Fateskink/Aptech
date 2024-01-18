import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Image(
                image: AssetImage('images/background.jpeg'),
                fit: BoxFit.cover,
                width: screenWidth,
                height: screenHeight,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello', style: TextStyle(fontSize: 60, color: Colors.black),),
                    Text('This is test', style: TextStyle(fontSize: 20, color: Colors.black),),
                    Expanded(child: Container()),
                    Container(
                      height: screenHeight * 0.25,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                // Add your onTap logic here
                              },
                              child: Text('Login'),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            child: Text('Sign up'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                padding: EdgeInsets.all(10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
