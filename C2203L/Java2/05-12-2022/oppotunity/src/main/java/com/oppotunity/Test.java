package com.oppotunity;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Test {
    private List<Oppotunity> oppotunities = new ArrayList<Oppotunity>();
    private int numberOfOppotunities = 0;
    private String fileName = "data_file.bat";

    public void inputOpportunities() {
        //fake
        this.oppotunities.add(new Oppotunity("11", "t111122222222", 12.3f,
                new ArrayList<String>(Arrays.asList(new String[] {"sk1", "sk2"})),
                new ArrayList<String>(Arrays.asList(new String[] {"uni1", "uni2"})))
        );
        this.oppotunities.add(new Oppotunity("22", "t221122222222", 22.3f,
                new ArrayList<String>(Arrays.asList(new String[] {"skxx1", "skxx2"})),
                new ArrayList<String>(Arrays.asList(new String[] {"xxuni1", "xxuni2"})))
        );
        for(int i = 0; i < this.numberOfOppotunities; i++) {
            System.out.println(String.format("Enter oppotunity: %d", i+1));
            Oppotunity oppotunity = new Oppotunity();
            oppotunity.input();
            oppotunities.add(oppotunity);
        }
    }
    public void saveToFile() {
        try {
            FileOutputStream fileOut = new FileOutputStream(this.fileName);
            ObjectOutputStream objectOut = new ObjectOutputStream(fileOut);
            objectOut.writeObject(oppotunities);
            objectOut.close();
            System.out.println("The Object  was succesfully written to a file");
        } catch (Exception ex) {
            System.err.println("Cannot save data to file");
            ex.printStackTrace();
        }
    }
}
