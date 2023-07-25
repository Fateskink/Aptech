package com.aptech.bookapp.controllers;

import com.aptech.bookapp.models.User;
import com.aptech.bookapp.services.IUserService;
import com.aptech.bookapp.viewmodels.UserLoginViewModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/users")
@RequiredArgsConstructor
public class UserController {
    //inject service
    private final IUserService userService;
    @GetMapping("/login")
    //view model = Data Transfer Object = Request Object
    public String login(Model model) {
        //model.addAttribute("book", 1book);//gủi dữ liệu từ controller => view
        return "user/login"; //ten view: login.html
    }
    //sau khi bam login, gui reques post den ham nay
    @PostMapping("/login")
    public String loginUser(UserLoginViewModel model) {
        //xử lý nghiệp vụ(gọi service)
        User user = userService.login(model.getUsername(), model.getPassword());
        //new sai mat khau hoac user ko ton tai
        if(user == null) {
            return "user/login"; //toi uu cach nao cho gui lai  @GetMapping("/login")
        }
        return "home/index"; //ten view: login.html
    }
}
