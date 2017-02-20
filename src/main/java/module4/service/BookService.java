package module4.service;

import module4.pojo.Book;

import java.util.List;

public interface BookService {

    void save(Book book);
    void updateBook(Book book);
    void delete(int id);
    Book getById(int id);
    Book getByName(String bookTitle);
    List<Book> getBooks();
}
