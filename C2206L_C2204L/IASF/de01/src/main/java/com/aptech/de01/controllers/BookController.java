package com.aptech.de01.controllers;

import com.aptech.de01.dtos.requests.BookRequest;
import com.aptech.de01.models.Book;
import com.aptech.de01.services.book.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/books")
@RequiredArgsConstructor
public class BookController {
    private final BookService bookService;
    private List<String> fakedCategoryNames = List.of("Nhật ký", "Tản Văn", "Du lịch", "Kỹ thuật");

    @GetMapping("")
    public String getAllBooks(Model model) {
        List<Book> books = bookService.findAll();
        model.addAttribute("books", books);
        return "book/list";
    }
    //Hien ra giao dien de insert
    @GetMapping("/insert")
    public String insertBook(Model model) {
        model.addAttribute("categories", fakedCategoryNames);
        return "book/insert"; //insert.html
    }

    //Nhap du lieu vao form insert, sau do bam insert
    @PostMapping("/create")
    public String createBook(BookRequest bookDTO) {
        //BookRequest
        bookService.insert(bookDTO);
        return "redirect:/books";
    }
}