package com.aptech.de02.de02.controllers;
import com.aptech.de02.de02.models.Category;
import com.aptech.de02.de02.models.Product;
import com.aptech.de02.de02.repositories.CategoryRepository;
import com.aptech.de02.de02.repositories.ProductRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/products")
@RequiredArgsConstructor
public class ProductController {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    @GetMapping("")
    public String index(@Param("categoryID") String categoryID,
                        Model model) {
        List<Product> products = productRepository.findByCategoryCategoryID(categoryID);
        model.addAttribute("products", products);
        return "products/index";
    }
    @GetMapping("assign")
    public String assignProductToCategory(@RequestParam("productID") String productID,
                                          Model model) {
        List<Category> categories = categoryRepository.findAll();
        Product selectedProduct = productRepository.findById(productID).get();
        model.addAttribute("categories", categories);
        model.addAttribute("selectedCategory", selectedProduct.getCategory());
        return "products/assignProductToCategory";
    }
    @PostMapping("/products/update-category")
    @Transactional
    public String updateProductCategory(@RequestParam("productID") String productID,
                                        @RequestParam("categoryID") String categoryID) {
        Product selectedProduct = productRepository.findById(productID).get();
        selectedProduct.setCategory(selectedProduct.getCategory());
        return "redirect:/products";
    }
}
