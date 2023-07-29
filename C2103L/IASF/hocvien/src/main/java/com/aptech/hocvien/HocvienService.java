package com.aptech.hocvien;

import com.aptech.hocvien.models.Hocvien;
import com.aptech.hocvien.repositories.HocvienRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HocvienService {
    private final HocvienRepository hocvienRepository;
    List<Hocvien> findAll() {
        return hocvienRepository.findAll();
    }
    Hocvien findHocvienByName(String name) {
        return hocvienRepository.findHocvienByName(name);
    }
}
