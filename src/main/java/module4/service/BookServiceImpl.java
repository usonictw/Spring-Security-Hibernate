package module4.service;

import module4.dao.BookDAO;
import module4.pojo.Book;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDAO bookDAO;

    @Transactional
    public void save(Book book) {
        this.bookDAO.save(book);
    }

    public void updateBook(Book book) {
        this.bookDAO.saveAndFlush(book);
    }

    public void delete(int id) {
        this.bookDAO.delete(id);
    }

    public Book getById(int id) {
        return this.bookDAO.getOne(id);
    }

    public List<Book> getBooks() {
        return this.bookDAO.findAll();
    }

    public Book getByName(String bookTitle){
        return  this.bookDAO.findBookByName(bookTitle);
    }
}
