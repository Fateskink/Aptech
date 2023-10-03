//import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';

int countSubstringOccurrences(String substring, String text) {
  List<String> parts = text.split(substring);
  int count = parts.length - 1;
  return count;
}

void buildMenu() {
  int choice = 0;
  int numberOfCourses = 0;
  while(choice != 4) {
    print('1-Input detail information of courses');
    print('2-Sort & Display detail information of courses');
    print('3-Export all courses into file named course.dat by binary mode');
    print('4-Exit');
    print('Enter your choice:');
    choice = int.parse(stdin.readLineSync() ?? '0');
    switch(choice) {
      case 1:
        print('You chooose 1');
        while(numberOfCourses <= 0) {
          print('Number of courses: ');
          numberOfCourses = int.parse(stdin.readLineSync()!);
          for(int i = 0; i < numberOfCourses; i++) {

          }
        }
      case 2:
        print('You chooose 2');
      case 3:
        print('You chooose 3');
      case 4:
        print('You chooose 4');
      default:
        print('Please choose 1-4');
    }
  }

}
void bai01(){
  print("input source :");
  String source = stdin.readLineSync()!;
  print("input searching :");
  String searching = stdin.readLineSync()!;
  int count = countSubstringOccurrences(searching, source);
  print('The substring "$searching" appears in "$source" $count times.');
}
void main() {
  //bai01();
  buildMenu();
  //runApp(const MyApp());
}



