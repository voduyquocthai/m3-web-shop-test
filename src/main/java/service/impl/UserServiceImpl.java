package service.impl;

import dao.impl.UserDaoImpl;
import dao.UserDao;
import model.User;
import service.UserService;

import java.io.File;
import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void edit(User user) {
        User user1 = userDao.get(user.getId());
        user1.setUsername(user.getUsername());
        user1.setEmail(user.getEmail());
        user1.setPassword(user.getPassword());
        user1.setRoleId(user.getRoleId());
        user1.setAvatar(user.getAvatar());
        userDao.edit(user1);
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    public User get(String username) {
         return userDao.get(username);
    }

    @Override
    public User get(int id) {
        return userDao.get(id);
    }

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassword())){
            return user;
        }
        return null;
    }

    @Override
    public boolean register(String email, String password, String username) {
        if (userDao.checkExistUsername(username)){
            return false;
        }
        userDao.insert(new User(username,password,email));
        return true;
    }

    @Override
    public List<User> getAll() {
        return userDao.getAll();
    }

    @Override
    public List<User> search(String keyword) {
        return userDao.search(keyword);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userDao.checkExistEmail(email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return userDao.checkExistUsername(username);
    }
}
