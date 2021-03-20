package service;

import model.Product;

import java.util.List;

public interface ProductService {
    void insert(Product product);

    void edit(Product product);

    void delete(int id);

    Product get(int id);

    List<Product> getAll();

    List<Product> search(String username);

    List<Product> searchByCategory(int cate_id);

    List<Product> searchByName(String productName);
    List<Product> searchByName(String productName, int cate_id);

    List<Product> getRandomProduct(int number);
}
