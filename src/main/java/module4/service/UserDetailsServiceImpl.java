package module4.service;

import module4.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;
import module4.pojo.Role;
import module4.pojo.User;
import java.util.HashSet;
import java.util.Set;

/**
 * Implementation of {@link org.springframework.security.core.userdetails.UserDetailsService}
 * @author Vladimir Mishchenko
 */
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDAO.findByUserName(username);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<GrantedAuthority>();
        for (Role r : user.getRoleSet()){
            grantedAuthorities.add(new SimpleGrantedAuthority(r.getName()));
        }
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(),
                grantedAuthorities);
    }
}
