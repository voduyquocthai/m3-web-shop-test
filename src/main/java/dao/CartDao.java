package dao;

import model.Cart;

import java.sql.SQLException;
import java.util.List;

public interface CartDao {
    void insert(Cart cart);

    void edit(Cart cart);

    void delete(int id);

    Cart get(String name);

    Cart get(int id);

    List<Cart> getAll();

    List<Cart> search(String name);
}
