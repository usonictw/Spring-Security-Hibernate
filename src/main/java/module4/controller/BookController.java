package module4.controller;

import module4.pojo.Book;
import module4.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {

    private BookService bookService;


    public void setBookService(BookService bs) {
        this.bookService = bs;
    }

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String bookList(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("bookList", this.bookService.getBooks());
        return "books";
    }

    @RequestMapping(value = "/addBook", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            this.bookService.save(book);
        } else {
            this.bookService.updateBook(book);
        }
        return "redirect:/books";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        this.bookService.delete(id);
        return "redirect:/books";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {

        model.addAttribute("book", this.bookService.getById(id));
        model.addAttribute("bookList", this.bookService.getBooks());

        return "books";
    }

    @RequestMapping(value = "/bookData/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {

        model.addAttribute("book", this.bookService.getById(id));

        return "bookdata";
    }
}
