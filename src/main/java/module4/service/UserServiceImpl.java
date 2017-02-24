package module4.service;

import module4.dao.RoleDAO;
import module4.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import module4.pojo.Role;
import module4.pojo.User;
import java.util.HashSet;
import java.util.Set;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RoleDAO roleDAO;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Transactional
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<Role>();
        roles.add(roleDAO.getOne(1));
        user.setRoleSet(roles);
        userDAO.save(user);
    }

    @Transactional
    public User findByUserName(String userName) {
        return userDAO.findByUserName(userName);
    }
}
