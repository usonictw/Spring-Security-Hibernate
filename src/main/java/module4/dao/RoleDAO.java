package module4.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import module4.pojo.Role;
import org.springframework.stereotype.Repository;


@Repository
public interface RoleDAO extends JpaRepository<Role, Integer>{

}
