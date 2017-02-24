package module4.service;

import module4.pojo.Book;

import java.util.List;

public interface BookService {

    void save(Book book);
    void updateBook(Book book);
    void delete(Integer id);
    Book getById(Integer id);
    //Book getByName(String bookTitle);
    List<Book> getBooks();
}
