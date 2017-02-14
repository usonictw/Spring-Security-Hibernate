package module4.service;

public interface SecurityService {

    String findLoggedInUserName();

    void autoLogin(String userName, String password);
}
