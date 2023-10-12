package com.aptech.de02.de02.repositories;

import com.aptech.de02.de02.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, String> {
    List<Product> findByCategoryCategoryID(String categoryId);
}