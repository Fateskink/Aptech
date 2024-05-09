package com.aptech.de09.controllers;

import com.aptech.de09.dtos.requests.LoginRequest;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {
    @GetMapping("/login")
    public String login(Model model) {
        return "user/login";//view path
    }
    @PostMapping("/login")
    public String performLogin(@Valid LoginRequest loginRequest, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            //truyền string lỗi lên user/login
            return "user/login";
        }
        //truy cap xuong db, kiem tra co user do ko,....
        return "home";


    }
}
