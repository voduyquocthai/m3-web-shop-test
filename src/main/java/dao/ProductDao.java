package dao;

import model.Product;

import java.util.List;

public interface ProductDao {
    void insert(Product product);

    void edit(Product product);

    void delete(int id);

    Product get(int id);

    List<Product> getAll();

    List<Product> search(String username);

    List<Product> seachByCategory(int cate_id);

    List<Product> seachByName(String productName);
}
