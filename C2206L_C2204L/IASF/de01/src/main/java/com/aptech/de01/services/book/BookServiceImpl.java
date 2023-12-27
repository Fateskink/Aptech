package com.aptech.de01.services.book;

import com.aptech.de01.dtos.requests.BookRequest;
import com.aptech.de01.models.Book;
import com.aptech.de01.repositories.BookRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookServiceImpl implements BookService{
    private final BookRepository bookRepository;
    @Override
    public List<Book> findAll() {
        return bookRepository.findAll();
    }

    @Override
    @Transactional
    public void insert(BookRequest bookDTO) {
        //convert DTO to Model
        Book newBook = Book.builder()
                .title(bookDTO.getTitle())
                .price(bookDTO.getPrice())
                .category(bookDTO.getCategory())
                .build();
        bookRepository.save(newBook);
    }

}
