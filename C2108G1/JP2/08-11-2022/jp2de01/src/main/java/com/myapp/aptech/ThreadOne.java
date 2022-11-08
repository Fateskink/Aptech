package com.myapp.aptech;

public class ThreadOne extends Thread{
    private Data data;
    public ThreadOne(Data data ) {
        this.data = data;
    }
    @Override
    public void run() {
        super.run();
        try {
            for(int i = 0; i < data.getData().length; i++) {
                synchronized (this) {
                    sleep(1000);
                    String eachItem = data.getData()[i].toUpperCase();
                    System.out.println("Thread1 set item: "+eachItem);
                    this.getData().setSelectedString(eachItem);
                    //notify to thread2
                    notify();
                }
            }
            synchronized (this) {
                this.getData().setSelectedString(null);
            }
        } catch (InterruptedException e) {
            System.err.println("Cannot run thread1: "+e.getMessage());
        }
    }

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}
