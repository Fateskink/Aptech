package com.aptech.de02.controllers;

import com.aptech.de02.models.Category;
import com.aptech.de02.models.Product;
import com.aptech.de02.repositories.CategoryRepository;
import com.aptech.de02.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
@RequestMapping("/products") //routing
@RequiredArgsConstructor
//url path to this controller
public class ProductController {
    private final ProductRepository productRepository;
    @GetMapping("")
    public String index(@RequestParam("categoryId") String categoryId, Model model){
        List<Product> products = productRepository.findByCategoryCategoryId(categoryId);
        //ViewBag.products = products;
        model.addAttribute("products", products);
        return "products/index";
    }
}
