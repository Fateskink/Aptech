package com.aptech.bookapp.services;

import com.aptech.bookapp.models.User;
import org.springframework.stereotype.Service;

@Service
public interface IUserService {
    User login(String username, String password);
}
