package com.aptech.bookapp.services;

import com.aptech.bookapp.models.User;
import com.aptech.bookapp.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserService implements IUserService{
    //inject
    private final UserRepository userRepository;
    @Override
    public User login(String username, String password) {
        //Khởi tạo Repo => DI (Dependency Injection)
        return userRepository.findByUsernameAndPassword(username, password)
                .orElse(null);
    }
}
