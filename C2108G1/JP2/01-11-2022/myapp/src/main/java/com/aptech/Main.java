package com.aptech;

import com.aptech.models.*;

import java.util.*;

public class Main {
    public static void main(String[] args) {
        Artist tungDuong = new Artist("Tung Duong");
        Artist quangTho = new Artist("Quang Tho");
        Artist quangLe = new Artist("Quang Le");
        Artist nhuQuynh = new Artist("Nhu Quynh");

        //List<Track> track1 = new ArrayList<Track>();
        //track1.add(new Track("Bai ca hi vong", 12000));
        List<Track> track1 = Arrays.asList(
                new Track("Bai ca hi vong", 12000),
                new Track("Ao mua dong", 12000),
                new Track("Ao mua dong", 130),
                new Track("Que nha", 1500),
                new Track("Me yeu con", 12300),
                new Track("Me yeu con", 12300)
        );
        List<Track> track2 = Arrays.asList(
                new Track("Ha buon", 500),
                new Track("Vung la me bay", 1000),
                new Track("Noi buon hoa phuong", 134),
                new Track("Phuong hong", 10000)
        );
        Album album1 = new Album("Tung Duong hat tinh ca");
        album1.setTracks(track1);
        ArrayList<Artist> musicians = (ArrayList<Artist>)album1.getMusicians();
        musicians.add(tungDuong);
        (album1.getMusicians()).add(new Artist());
    }
}