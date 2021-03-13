package service;

import model.CartItem;

import java.util.List;

public interface CartItemService {
    void insert(CartItem cartItem);

    void edit(CartItem cartItem);

    void delete(String id);

    CartItem get(int id);

    List<CartItem> getAll();

    List<CartItem> search(String keyword);
}
