package dao;

import model.User;

import java.util.List;

public interface UserDao {
    void insert(User user);

    void edit(User user);

    void delete(User user);

    User get(String username);

    User get(int id);

    List<User> getAll();

    List<User> search(String username);

    boolean checkExistEmail(String email);

    boolean checkExistUsername(String username);
}
