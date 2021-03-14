package dao.Impl;

import dao.UserDao;
import model.User;

import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public void insert(User user) {
        
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
    public List<User> getAll() {
        return null;
    }

    @Override
    public List<User> search(String username) {
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
