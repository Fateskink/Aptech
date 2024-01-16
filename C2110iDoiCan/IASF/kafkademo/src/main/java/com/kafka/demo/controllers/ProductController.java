package com.kafka.demo.controllers;

import com.kafka.demo.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;
import com.kafka.demo.models.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/search")
    public List<Product> searchProducts(
            @RequestParam("query") String query, Pageable pageable) {
        Page<Product> productsPage = productRepository.findByProductNameAndDescription(query, pageable);
        return productsPage.getContent();
    }
}