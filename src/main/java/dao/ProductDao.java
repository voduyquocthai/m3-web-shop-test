package dao;

import model.Product;

import java.util.List;

public interface ProductDao {
    void insert(Product product);

    void edit(Product product);

    void delete(int id);

    Product get(int id);

    List<Product> getAll();

    List<Product> search(String keyword);

    List<Product> searchByCategory(int cate_id);

    List<Product> searchByName(String product_name_keyword);
}
