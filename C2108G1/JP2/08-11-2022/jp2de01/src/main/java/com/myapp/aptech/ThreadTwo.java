package com.myapp.aptech;

public class ThreadTwo extends Thread{
    private Data data;
    public ThreadTwo(Data data ) {
        this.data = data;
    }
    @Override
    public void run() {
        super.run();
        try {
            sleep(1000);

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