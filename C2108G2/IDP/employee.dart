import 'dart:io';

class Employee {
    String? id;
    String name;
    int workingDay;
    double dailySalary;
    Employee({
        this.id,
        required this.name,
        required this.workingDay,
        required this.dailySalary,
    });
    factory Employee.input() {
        print('Enter id: ');
        String id = stdin.readLineSync() ?? "";

        print('Enter name: ');
        String name = stdin.readLineSync() ?? "";
        int workingDay = 0;
        while(true) {
            print('Enter workingDay: ');
            int workingDay = int.parse(stdin.readLineSync() ?? "0");
            if(workingDay > 1 || workingDay < 31) {
                break;
            }
        }

        print('Enter dailySalary: ');
        double dailySalary = double.parse(stdin.readLineSync() ?? "0");
        return new Employee(id: id, name: name, workingDay: workingDay, dailySalary: dailySalary);
    }
    @override
  String toString() {
    // TODO: implement toString
    return 'id: ${id}, '
        'name: ${name}, '
        'workingDay: ${workingDay}, '
        'dailySalary: ${dailySalary}, '
    ;
  }
}