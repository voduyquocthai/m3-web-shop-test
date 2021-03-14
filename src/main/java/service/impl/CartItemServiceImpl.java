package service.impl;

import dao.CartItemDao;
import dao.Impl.CartItemDaoImpl;
import model.CartItem;
import service.CartItemService;

import java.util.List;

public class CartItemServiceImpl implements CartItemService {
    CartItemDao cartItemDao = new CartItemDaoImpl();

    @Override
    public void insert(CartItem cartItem) {
        cartItemDao.insert(cartItem);
    }

    @Override
    public void edit(CartItem cartItem) {
        CartItem cartItem1 = cartItemDao.get(cartItem.getId());
        cartItem1.setCart(cartItem.getCart());
        cartItem1.setProduct(cartItem.getProduct());
        cartItem1.setQuantity(cartItem.getQuantity());
        cartItem1.setUnitPrice(cartItem.getUnitPrice());
        cartItemDao.edit(cartItem1);
    }

    @Override
    public void delete(String id) {
        cartItemDao.delete(id);
    }

    @Override
    public CartItem get(int id) {
        return cartItemDao.get(id);
    }

    @Override
    public List<CartItem> getAll() {
        return cartItemDao.getAll();
    }

    @Override
    public List<CartItem> search(String keyword) {
        return cartItemDao.search(keyword);
    }
}
