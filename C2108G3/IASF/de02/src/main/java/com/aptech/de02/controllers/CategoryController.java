package com.aptech.de02.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/categories") //routing
//url path to this controller
public class CategoryController {
    private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
    @GetMapping("")
    //this method returns "view's name"
    public String index(
            @RequestParam("x") int x,
            @RequestParam("y") int y,
            Model model
    ) {
        logger.info(String.format("x = %d, y= %d",x, y));
        return "categories/index";
    }

}
