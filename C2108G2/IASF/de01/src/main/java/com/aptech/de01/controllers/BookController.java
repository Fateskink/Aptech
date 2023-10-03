package com.aptech.de01.controllers;
import com.aptech.de01.viewmodels.user.LoginViewModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class BookController {
    @GetMapping("/books")
    public String home(Model model) {
        return "book/home";//view's name
    }
    @PostMapping("/insert-book")
    public String insertBook(@ModelAttribute("book") Book book) {
        // Add logic to save the book to the database using your service
        return "redirect:/books/list-all-books"; // Redirect to the list of books after insertion
    }

    // Mapping to handle logout (assuming a POST request)
    @PostMapping("/logout")
    public String logout() {
        // Add logic for logout, such as clearing the session or token
        return "redirect:/login"; // Redirect to the login page after logout
    }
}
/*
* <ul>
    <li>
        <a href="@{/books/list-all-books}">List all book</a>
    </li>
    <li>
        <a href="@{/books/insert-book}">Insert book</a>
    </li>
    <li>
        <form method="post" action="@{/books/logout}">
            <button type="submit">Logout</button>
        </form>
    </li>
</ul>
*/