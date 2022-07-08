package com.example.de01.controllers;

import lombok.Generated;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping(path = "/books")
public class BookController {
    @GetMapping("")
    public String getAllBooks() {
        return "books";//books.jsp
    }
}
