package module4.service;

import module4.dao.BookDAO;
import module4.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDAO bookDAO;

    @Transactional
    public void save(Book book) {
        this.bookDAO.save(book);
    }

    @Transactional
    public void updateBook(Book book) {

        this.bookDAO.saveAndFlush(book);
    }

    @Transactional
    public void delete(int id) {
        this.bookDAO.delete(id);
    }

    @Transactional
    public Book getById(int id) {
        return this.bookDAO.getOne(id);
    }

    @Transactional
    public List<Book> getBooks() {
        return this.bookDAO.findAll();
    }

    /*
    @Transactional
    public Book getByName(String bookTitle){
        return  this.bookDAO.findBookByName(bookTitle);
    }
    */
}
