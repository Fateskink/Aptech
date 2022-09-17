package com.aptech.aprotrain;

import java.util.Scanner;

public class StudentManagement {
    public void addStudent(){
        System.out.println("addStudent");
    }
    public void showStudent(){
        System.out.println("showStudent");
    }
    public void sortStudentByMark(){
        System.out.println("showStudent");
    }
//    private Scanner getScanner() {
//        return new Scanner(System.in);
//    }
    public void showMenu() {
        int choice = 0;
        while(choice != 4) {
            System.out.println("=== MENU ===\n" +
                    "1.Add New.\n" +
                    "2.Show All.\n" +
                    "3.Sort.\n" +
                    "4.Exit.\n" +
                    "Your choice: \n");
            choice = Helper.getScanner().nextInt();
            switch (choice) {
                case 1: {
                    this.addStudent();
                }
                    break;
                case 2: {
                    this.showStudent();
                }
                    break;
                case 3: {
                    this.sortStudentByMark();
                }
                    break;
                case 4:
                    break;
                default:
                    System.out.println("You must choose 1,2,3,4");
            }
        }
        System.out.println("Program end");
    }

}
