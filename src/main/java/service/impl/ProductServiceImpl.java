package service.impl;


import dao.ProductDao;
import dao.impl.ProductDaoImpl;
import model.Product;
import service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    ProductDao productDao = new ProductDaoImpl();

    @Override
    public void insert(Product product) {
        productDao.insert(product);
    }

    @Override
    public void edit(Product product) {
        Product product1 = productDao.get(product.getId());
        product1.setName(product.getName());
        product1.setPrice(product.getPrice());
        product1.setCategory(product.getCategory());
        product1.setDes(product.getDes());
        product1.setImage(product.getImage());
        productDao.edit(product1);
    }

    @Override
    public void delete(int id) {
        productDao.delete(id);
    }

    @Override
    public Product get(int id) {
        return productDao.get(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.getAll();
    }

    @Override
    public List<Product> search(String username) {
        return productDao.search(username);
    }

    @Override
    public List<Product> searchByCategory(int cate_id) {
        return productDao.searchByCategory(cate_id);
    }

    @Override
    public List<Product> searchByName(String productName) {
        return productDao.searchByName(productName);
    }

    @Override
    public List<Product> searchByName(String productName, int cate_id) {
        return productDao.searchByName(productName,cate_id);
    }

    @Override
    public List<Product> getRandomProduct(int number) {
        return productDao.getRandomProduct(number);
    }
}
