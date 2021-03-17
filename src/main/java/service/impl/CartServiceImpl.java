package service.impl;

import dao.CartDao;
import dao.CategoryDao;
import dao.Impl.CartDaoImpl;
import dao.Impl.CategoryDaoImpl;
import model.Cart;
import service.CartService;
import service.CategoryService;

import java.util.List;

public class CartServiceImpl implements CartService {
    CartDao cartDao = new CartDaoImpl();

    @Override
    public void insert(Cart cart) {
        cartDao.insert(cart);
    }

    @Override
    public void edit(Cart newCart) {
        Cart cart = cartDao.get(newCart.getId());
        cart.setBuyDate(newCart.getBuyDate());
        cart.setUser(newCart.getUser());
        cartDao.edit(cart);
    }

    @Override
    public void delete(int id) {
        cartDao.delete(id);
    }

    @Override
    public Cart get(int id) {
        return cartDao.get(id);
    }

    @Override
    public List<Cart> getAll() {
        return cartDao.getAll();
    }

    @Override
    public List<Cart> search(String keyword) {
        return cartDao.search(keyword);
    }
}
