package com.myapp.aptech;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class StudentTest {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<Student>();
        try {
            for(int i = 0; i < 5; i++) {
                Student student = new Student();
                student.input();
            }
        }catch (Exception e) {
            System.err.println("Error creating object : "+e.getMessage());
        }
    }
}
