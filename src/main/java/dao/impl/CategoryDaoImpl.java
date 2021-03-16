package dao.impl;

import dao.CategoryDao;
import jdbc.JDBCConnection;
import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    @Override
    public void insert(Category category) {
        String sql = "INSERT INTO Category (name) VALUES (?)";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
            ps.setString(1, category.getName());
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Category category) {
        String sql = "UPDATE Category SET name = ? WHERE id = ? ";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ps.setString(1, category.getName());
            ps.setInt(2,category.getId());
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM Category WHERE id = ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public Category get(int id) {
        String sql = "SELECT * FROM Category WHERE id = ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Category category =  new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                return category;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Category get(String name) {
        String sql = "SELECT * FROM Category WHERE name = ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Category category =  new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                return category;
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> getAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
                ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                categories.add(category);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public List<Category> search(String cate_name_keyword) {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM Category WHERE name LIKE ?";

        try (
                Connection con =  JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
            ps.setString(1, "%" + cate_name_keyword + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Category category =  new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                categories.add(category);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return categories;

    }
}
