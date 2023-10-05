package com.aptech.de01.controllers;
import com.aptech.de01.models.Book;
import com.aptech.de01.repositories.BookRepository;
import com.aptech.de01.viewmodels.user.LoginViewModel;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;


@Controller
@RequiredArgsConstructor
public class BookController {
    private final BookRepository bookRepository;
    @GetMapping("/books")
    public String home(Model model) {
        return "book/home";//view's name
    }
    @PostMapping("/books/insert-book")
    public String insertBook(@ModelAttribute("book") Book book) {
        // Add logic to save the book to the database using your service
        return "book/list-all-books"; // Redirect to the list of books after insertion
    }

    @GetMapping("/books/insert-book")
    public String createBook() {
        // Add logic to save the book to the database using your service
        return "book/insert-book"; // Redirect to the list of books after insertion
    }

    // Mapping to handle logout (assuming a POST request)

    @GetMapping("/books/list-all-books")
    public String listAllBooks(Model model) {
        List<Book> books = bookRepository.findAll();
        model.addAttribute("books", books);
        return "book/list-books";
    }

    @PostMapping("/logout")
    public String logout() {
        // Add logic for logout, such as clearing the session or token
        return "redirect:/login"; // Redirect to the login page after logout
    }
}