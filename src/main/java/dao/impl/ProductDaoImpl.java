package dao.impl;


import dao.ProductDao;
import jdbc.JDBCConnection;
import model.Category;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
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

            ps.executeQuery();
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
        String sql = "SELECT Product.id, Product.name AS p_name, Product.price, Product.des, Product.img, category.name AS c_name, category.id AS c_id " +
                " FROM Product INNER JOIN Category ON product.cate_id = category.id WHERE product.id = ? ";


        try(
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ){
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Product product = new Product();

            }

        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getAll() {
        return null;
    }

    @Override
    public List<Product> search(String username) {
        return null;
    }

    @Override
    public List<Product> searchByCategory(int cate_id) {
        return null;
    }

    @Override
    public List<Product> searchByName(String product_name_keyword) {
        return null;
    }
}
