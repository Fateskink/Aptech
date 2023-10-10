package com.aptech.de02.de02.controllers;
import com.aptech.de02.de02.models.Category;
import com.aptech.de02.de02.models.Product;
import com.aptech.de02.de02.repositories.CategoryRepository;
import com.aptech.de02.de02.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {
    private final ProductRepository productRepository;
    @GetMapping("")
    public String index(Model model) {
        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        return "products/index";
    }
}
