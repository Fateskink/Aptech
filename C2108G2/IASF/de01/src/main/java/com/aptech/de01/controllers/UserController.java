package com.aptech.de01.controllers;
import com.aptech.de01.viewmodels.user.LoginViewModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {
    @GetMapping("/users/login")
    public String login(Model model) {
        model.addAttribute("loginViewModel", new LoginViewModel());
        return "user/login";//view's name
    }
    @PostMapping("/users/login")
    public String signin(
            @ModelAttribute("loginViewModel") LoginViewModel loginViewModel,
            BindingResult bindingResult
    ) {
        if (bindingResult.hasErrors()) {
            // Validation failed, return to the login form with error messages
            return "/users/login";
        }
        return "redirect:/books";
    }

}
