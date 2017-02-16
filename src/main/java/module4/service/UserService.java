package module4.service;

import module4.pojo.User;

public interface UserService {

    void save(User user);
    User findByUserName(String userName);
}
