package com.aptech;

import com.aptech.inheritance.Rectangle;
import com.aptech.temp.MyPrintStream;

import java.io.PrintStream;

public class Main {
    public static void main(String[] args) {
        Question01 question01 = new Question01();
        int wordCount = question01.countWord("Welcome to Aptech");
        //System.out.println("Number of words is: "+wordCount);

//        System.out.println(String.format("Number of words is: %d", wordCount));
//        StudentManager studentManager = new StudentManager();
//        studentManager.inputStudents();
//        studentManager.showAllStudents();

//        PrintStream out = System.out;
//        out.println("hehe");
        MyPrintStream.println("chao cac ban", false);
        MyPrintStream.println("cai nay de test");
        Rectangle rectangle1 = new Rectangle("hinh chu nhat A",
                "red", 10, 20);
        Rectangle rectangle2 = new Rectangle("hinh chu nhat B",
                "green", 20, 30);
        System.out.println(rectangle1.toString());
        System.out.println(rectangle2.toString());

    }
}