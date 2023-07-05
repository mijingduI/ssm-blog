package kybmig.ssm.service;


import kybmig.ssm.mapper.TopicMapper;
import kybmig.ssm.mapper.UserMapper;
import kybmig.ssm.model.UserModel;
import kybmig.ssm.model.UserRole;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserService {
    private UserMapper mapper;
    
    public UserService(UserMapper topicMapper) {
        this.mapper = topicMapper;
    }
    
    public UserModel add(String username, String password) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int createdTime = unixTime.intValue();
        UserModel m = new UserModel();
        m.setUsername(username);
        m.setPassword(password);
        m.setRole(UserRole.normal);
        m.setCreatedTime(createdTime);
        m.setUpdatedTime(createdTime);
        m.setAvatar("https://www.kuaibiancheng.com/uploads/avatar/default.gif");
        mapper.insert(m);
        return m;
    }
    
    public void update(Integer id, String username, String password) {
        Long unixTime = System.currentTimeMillis() / 1000L;
        int updatedTime = unixTime.intValue();
        UserModel m = new UserModel();
        m.setId(id);
        m.setUsername(username);
        m.setPassword(password);
        m.setUpdatedTime(updatedTime);
        mapper.update(m);
    }
    
    public void delete(Integer id) {
        mapper.delete(id);
    }

    public  UserModel findById(Integer id) {
        return mapper.selectOne(id);
    }
    public  UserModel findByUsername(String username) {
        return mapper.selectOneByUsername(username);
    }
    
    public boolean validateLogin(String username, String  password) {
        UserModel userModel = mapper.selectOneByUsername(username);
        if (userModel != null && userModel.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }
    public UserModel guest() {
        UserModel user = new UserModel();
        user.setRole(UserRole.guest);
        user.setId(-1);
        user.setUsername("游客");
        user.setPassword("游客");
        return user;
    }
    
    public UserModel currentUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("user_id");
        if (id == null) {
            return this.guest();
        } else {
            UserModel userModel = mapper.selectOne(id);
            if (userModel == null) {
                return this.guest();
            } else {
                return userModel;
            }
        }
    }
    
    public  List<UserModel> all() {
        return mapper.selectAll();
    }
}
