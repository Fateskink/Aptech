package com.myapp.aptech;

public class ThreadTwo extends Thread{
    private Data data;
    public ThreadTwo(Data data) {
        this.data = data;
    }
    @Override
    public void run() {
        super.run();
        while (true) {
            try {
                synchronized (this) {
                    sleep(1000);
                    if(data.getSelectedString() == null) {
                        break;
                    } else {
                        System.out.println("Thread2 received: " + data.getSelectedString());
                    }
                }
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
            //sleep(200);
        }

    }
    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}