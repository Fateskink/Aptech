import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  Home({
    super.key,    
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: ListView.builder(
          itemBuilder: ((BuildContext context, index) {
            return Padding(padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage('images/product01.jpeg'),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                ),
                SizedBox(width: 10.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('iphone 15', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    Text('This is an iphone', style: TextStyle(fontSize: 14),)
                  ],
                )
                
              ],
            ),);
          }),
          itemCount: 10,
        ),
      )),
    );
  }
}