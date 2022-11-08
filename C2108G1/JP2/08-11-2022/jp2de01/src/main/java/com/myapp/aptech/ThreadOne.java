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
                    //notify to thread2
                    wait();
                    notify();
                }
            }


        } catch (InterruptedException e) {
            System.err.println("Cannot run thread: "+e.getMessage());
        }
    }

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}
