package com.product.test;

import com.product.Product;
import com.product.books.Book;
import com.product.computers.Computer;

import javax.sound.midi.SysexMessage;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.function.Consumer;

public class Test {
    public static void main(String[] args) {
        int choice = 0;
        ArrayList<Computer> computers = new ArrayList<Computer>();
        ArrayList<Book> books = new ArrayList<Book>();
        while(choice != 5) {
            System.out.println("Please select:");
            System.out.println("1.Input information for n Computers.");
            System.out.println("2.Input information for n Books.");
            System.out.println("3.Display information of n Computers by sorting the");
            System.out.println("price descending.");
            System.out.println("4. Display information of n Books by sorting the");
            System.out.println("publisher ascending.");
            System.out.println("5.Exit.");
            System.out.println("Your choice:");
            if(choice == 1) {
                int numberOfComputers = 0;
                System.out.println("Number of computers: ");
                numberOfComputers = (new Scanner(System.in)).nextInt();
                for (int i = 0; i < numberOfComputers; i++) {
                    System.out.println("Enter information of computer : "+(i+1));
                    Computer computer = new Computer();
                    computer.input();
                    computers.add(computer);
                }

            } else if(choice == 2){
                int numberOfBooks = 0;
                System.out.println("Number of books: ");
                numberOfBooks = (new Scanner(System.in)).nextInt();
                for (int i = 0; i < numberOfBooks; i++) {
                    System.out.println("Enter information of book : "+(i+1));
                    Book book = new Book();
                    book.input();
                    books.add(book);
                }
            } else if(choice == 3){
                for(Computer computer: computers) {
                    computer.display();
                }
            } else if(choice == 4){
                books.forEach((Book book) -> {
                    book.display();
                });
            } else {
                System.out.println("Please choose 1-5");
            }
        }
    }
}
