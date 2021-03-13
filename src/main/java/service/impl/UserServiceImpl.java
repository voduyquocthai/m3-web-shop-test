package service.impl;

import DAO.Impl.UserDaoImpl;
import DAO.UserDao;
import model.User;
import service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public void insert(User user) {
        userDao.insert(user);
    }

    @Override
    public void edit(User user) {
        
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public User get(String username) {
        return null;
    }

    @Override
    public User get(int id) {
        return null;
    }

    @Override
    public User login(String username, String password) {
        return null;
    }

    @Override
    public boolean register(String email, String password, String username) {
        return false;
    }

    @Override
    public List<User> getAll() {
        return null;
    }

    @Override
    public List<User> search(String keyword) {
        return null;
    }

    @Override
    public boolean checkExistEmail(String email) {
        return false;
    }

    @Override
    public boolean checkExistUsername(String username) {
        return false;
    }
}
