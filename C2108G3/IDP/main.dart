import 'dart:io';

import 'mobile.dart';

List<Mobile> mobiles = [];

void main() {
  print('--------------------------------------------------');
  print('1 - Input list of mobiles');
  print('2 - Sort by name');
  print('3 - Analyze statistics of Mobiles by manufacturer');
  print('4 -  Find Mobiles by manufacturer and price');
  print('5 -  Exit');
  print('--------------------------------------------------');
  int choice = 0;
  while(choice != 5) {
    switch(choice) {
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
        if(choice != 5) {
          print('Please choose 1-4');
        }
    }
  }
}
void input() {
  int numberOfMobiles = int.parse(stdin.readLineSync() ?? "0");
  mobiles.clear();
  for(int i = 0; i < numberOfMobiles; i++) {
    Mobile mobile = Mobile.input();
    if(mobile != null) {
      mobiles.add(mobile);
    }
  }
}