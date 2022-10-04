package com.aptech;

import java.util.Scanner;

public class ExceptionMain {
    //bai 2
    public static void main(String[] args) {
        System.out.println("1. Input person");
        System.out.println("2. Find person");
        System.out.println("3. Exit");
        PersonManager personManager = new PersonManager();
        int choice = 0;
        while (choice != 3) {
            if(choice == 1) {
                personManager.getPersons();
            } else if(choice == 2) {
                System.out.println("Enter person's index to find: ");
                int index = (new Scanner(System.in)).nextInt();
                personManager.findPerson(index);
            }
        }
    }
}
