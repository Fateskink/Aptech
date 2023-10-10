package com.aptech.de02.de02.repositories;

import com.aptech.de02.de02.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, String> {
    @Override
    List<Category> findAll();
}