package com.aptech.de01.services.book;

import com.aptech.de01.dtos.requests.BookRequest;
import com.aptech.de01.models.Book;

import java.util.List;

public interface BookService {
    List<Book> findAll();
    void insert(BookRequest bookDTO);
}
