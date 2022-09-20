package com.aptech.de02;

public class Main {
    public static void main(String[] args) {
        SavingsAccount saver1 = new SavingsAccount(2000.0);
        SavingsAccount saver2 = new SavingsAccount(3000.0);
        SavingsAccount.modifyAnnualInterestRate(0.4f);
        saver1.calculateMonthlyInterest();
        saver2.calculateMonthlyInterest();
        System.out.println(saver1);
        System.out.println(saver2);

        SavingsAccount.modifyAnnualInterestRate(0.5f);
        saver1.calculateMonthlyInterest();
        saver2.calculateMonthlyInterest();

        System.out.println(saver1);
        System.out.println(saver2);
    }
}