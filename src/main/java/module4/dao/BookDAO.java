package module4.dao;

import module4.pojo.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BookDAO extends JpaRepository<Book, Integer>{

    @Query("select book_title from books b where b.book_title LIKE :name")
    Book findBookByName(@Param("name") String name);
}
