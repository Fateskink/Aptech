import 'dart:io';

class Course {
  late String authorName;
  late String courseName;
  late int price;
  late String address;
  late String description;
  late String startedDate;
  Course();
  void input(int index) {
    print('Input detail information of course (${index}): ');
    print('Input author name :');
    this.authorName = stdin.readLineSync()!;

    print('Input course name :');
    this.courseName = stdin.readLineSync()!;

    print('Input price :');
    this.price = int.parse(stdin.readLineSync()!);

    print('Input course’s address:');
    this.address = stdin.readLineSync()!;

    print('Input description :');
    this.description = stdin.readLineSync()!;

    print('Input started date(yyyy-mm-dd):');
    this.startedDate = stdin.readLineSync()!;
  }
}