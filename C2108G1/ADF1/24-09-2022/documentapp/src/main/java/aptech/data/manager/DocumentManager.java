package aptech.data.manager;

import aptech.data.impl.Book;

import java.util.ArrayList;
import java.util.function.Predicate;
import java.util.stream.Stream;

public class DocumentManager {
    private ArrayList<Book> books = new ArrayList<>();
    void addDocument(){

    }
    void displayAllDocument(){

    }
    void searchByAuthorName(String authorName){
        //common method
        ArrayList<Book> booksResult = new ArrayList<>();
        /*
        for(int i = 0; i < books.size(); i++) {
            Book eachBook = books.get(i);
            String eachAuthorName = eachBook.getAuthorName();
            if(eachAuthorName.toLowerCase().equals(authorName.toLowerCase())) {
                booksResult.add(eachBook);
            }
        }
        */
        for (Book eachBook: this.books) {
            if(eachBook.getAuthorName().toLowerCase().equals(authorName.toLowerCase())) {
                booksResult.add(eachBook);
            }
        }
        //use stream in Java8
        booksResult = (ArrayList<Book>) this.books
                .stream()
                .filter(new Predicate<Book>() {
                    @Override
                    public boolean test(Book book) {
                        return book.getAuthorName().toLowerCase().equals(authorName.toLowerCase());
                    }
                  })
                .toList();
        //use stream + lambda expression + oneline function
        booksResult = (ArrayList<Book>) this.books
                .stream()
                .filter((Book book) -> book.getAuthorName()
                        .toLowerCase()
                        .equals(authorName.toLowerCase()))
                .toList();
        //show result
        for (Book book: booksResult) {
            book.show();
        }
    }

}
