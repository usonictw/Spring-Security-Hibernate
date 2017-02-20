package module4.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import module4.pojo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDAO extends JpaRepository<User, Integer>{

    User findByUserName(String userName);
}
