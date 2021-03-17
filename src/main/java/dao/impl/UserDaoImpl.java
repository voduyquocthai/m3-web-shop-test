package dao.impl;

import dao.UserDao;
import jdbc.JDBCConnection;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public void insert(User user) {
        int roleId = 0;
        String sql = "INSERT INTO User (username, password, email, avatar, role_id) VALUES (?, ?, ?, ?, ?)";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAvatar());
            ps.setInt(5, user.getRoleId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(User user) {
        String sql = "UPDATE User SET username = ?, password = ?, email = ? , avatar = ?, role_id = ? WHERE id = ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAvatar());
            ps.setString(5, user.getAvatar());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {

        String sql = "DELETE FROM User WHERE id = ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User get(String username) {
        String sql = "SELECT * FROM User Where username = ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));
                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User get(int id) {
        String sql = "SELECT * FROM User Where id = ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));
                return user;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> getAll() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> search(String username) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM User WHERE name LIKE ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {

            ps.setString(1, "keyword");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatar(rs.getString("avatar"));
                user.setRoleId(Integer.parseInt(rs.getString("role_id")));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean checkExistEmail(String email) {
        boolean duplicate = false;
        String sql = "SELECT * FROM User WHERE email = ?";
        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {

            ps.setString(1, email);
            ResultSet resultSet = ps.getResultSet();
            if (resultSet.next()) {
                duplicate = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return duplicate;
    }

    @Override
    public boolean checkExistUsername(String username) {
        boolean duplicate = false;
        String sql = "SELECT * FROM User WHERE username = ?";

        try (
                Connection con = JDBCConnection.getJDBCConnection();
                PreparedStatement ps = con.prepareStatement(sql);
        ) {
            ps.setString(1, username);
            ResultSet resultSet = ps.getResultSet();
            if (resultSet.next()) {
                duplicate = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return duplicate;
    }
}
