package dao.impl;


import dao.ProductDao;
import jdbc.JDBCConnection;
import model.Category;
import model.Product;
import service.CategoryService;
import service.impl.CategoryServiceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    CategoryService categoryService = new CategoryServiceImpl();
    @Override
    public void insert(Product product) {
        String sql = "INSERT INTO Product ( name, price, cate_id, des, image ) VALUES ( ? , ? , ? , ? ,?)";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
            ps.setString(1, product.getName());
            ps.setFloat(2, product.getPrice());
            ps.setInt(3, product.getCategory().getId());
            ps.setString(4, product.getDes());
            ps.setString(5, product.getImage());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Product product) {
        String sql = "UPDATE Product SET name = ?, price = ?, cate_id = ?, des = ?, image = ? WHERE id = ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
            ps.setString(1, product.getName());
            ps.setFloat(2, product.getPrice());
            ps.setInt(3, product.getCategory().getId());
            ps.setString(4, product.getDes());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getId());
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }


    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Product WHERE id = ?";
        try(
                Connection con =  JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
                ){
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Product get(int id) {
        String sql = "SELECT Product.id, Product.name AS p_name, Product.price, Product.des, Product.image, category.name AS c_name, category.id AS c_id " +
                " FROM Product INNER JOIN Category ON product.cate_id = category.id WHERE product.id = ? ";

        try(
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
                ){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Category category = categoryService.get(rs.getInt("c_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("p_name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                return product;
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> getAll() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT Product.id, Product.name AS p_name, Product.price, Product.des, Product.image, category.name AS c_name, category.id AS c_id " +
                " FROM Product INNER JOIN Category ON product.cate_id = category.id";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category = categoryService.get(rs.getInt("c_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("p_name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                products.add(product);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> search(String keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE name LIKE ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);

        ){
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category = categoryService.get(rs.getInt("cate_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                products.add(product);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchByCategory(int cate_id) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT Product.id, Product.name AS p_name, Product.price, Product.des, Product.image, category.id AS c_id " +
                " FROM Product INNER JOIN Category ON product.cate_id = category.id WHERE category.id = ? ";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);

        ){
            ps.setInt(1, cate_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category = categoryService.get(rs.getInt("c_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("p_name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                products.add(product);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchByName(String product_name_keyword) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT Product.id, Product.name AS p_name, Product.price, Product.des, Product.image, category.id AS c_id " +
                " FROM Product INNER JOIN Category ON product.cate_id = category.id WHERE Product.name LIKE ? ";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);

        ){
            ps.setString(1, "%" + product_name_keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category = categoryService.get(rs.getInt("c_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("p_name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                products.add(product);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> getRandomProduct(int number) {
        List<Product> products = new ArrayList<>();
        String sql = "select * from product order by rand() limit ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ){
            ps.setInt(1,number);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category = categoryService.get(rs.getInt("cate_id"));
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getFloat("price"));
                product.setDes(rs.getString("des"));
                product.setImage(rs.getString("image"));
                product.setCategory(category);
                products.add(product);
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return products;
    }
}
