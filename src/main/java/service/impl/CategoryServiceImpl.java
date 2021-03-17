package service.impl;

import dao.CategoryDao;
import dao.impl.CategoryDaoImpl;
import model.Category;
import service.CategoryService;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    CategoryDao categoryDao = new CategoryDaoImpl();
    @Override
    public void insert(Category category) {
        categoryDao.insert(category);
    }

    @Override
    public void edit(Category category) {
        Category category1 = categoryDao.get(category.getId());
        category1.setName(category.getName());
        categoryDao.edit(category1);
    }

    @Override
    public void delete(int id) {
        categoryDao.delete(id);
    }

    @Override
    public Category get(int id) {
        return categoryDao.get(id);
    }

    @Override
    public Category get(String name) {
        return categoryDao.get(name);
    }

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public List<Category> search(String username) {
        return categoryDao.search(username);
    }
}
