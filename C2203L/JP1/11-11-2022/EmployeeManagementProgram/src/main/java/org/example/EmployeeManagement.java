package org.example;

import org.example.models.Employee;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Scanner;
import java.util.function.Consumer;

import static org.example.Utilities.getScanner;

public class EmployeeManagement {
    private ArrayList<Employee> employees = new ArrayList<Employee>();
    public void inputEmployees() {
        System.out.println("Number of employees: ");
        int numberOfEmployees = getScanner().nextInt();
        for(int i = 0; i < numberOfEmployees; i++) {
            Employee employee = new Employee();
            employee.input();
            employees.add(employee);
        }
    }
    public void sort() {
        //fake data
//        this.employees.add(new Employee(1, "aa", 12, 12f));
//        this.employees.add(new Employee(2, "zz", 12, 12f));
//        this.employees.add(new Employee(2, "bb", 12, 12f));

        this.employees.sort((Employee employee1, Employee employee2)
                -> employee1.getName().compareTo(employee2.getName()));
//        this.employees.stream()
//                .sorted((Employee employee1, Employee employee2)
//                        -> employee1.getName().compareTo(employee2.getName()))
//                .toList()
//                .forEach((Employee employee) -> {
//                    System.out.println(employee);
//                });
        this.employees.forEach((Employee employee) -> {
            System.out.println(employee);
        });
    }
}
