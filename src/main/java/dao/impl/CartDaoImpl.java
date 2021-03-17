package dao.impl;

import dao.CartDao;

import model.Cart;

import java.util.List;


import jdbc.JDBCConnection;
import model.User;
import service.UserService;
import service.impl.UserServiceImpl;

import java.sql.*;
import java.util.ArrayList;

public class CartDaoImpl implements CartDao {
    UserService userService = new UserServiceImpl();

        @Override
        public void insert(Cart cart) {
            String sql = "INSERT INTO Cart(u_id, buyDate) VALUES (?,?)";
            Connection con = JDBCConnection.getJDBCConnection();

            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, cart.getUser().getId());
                ps.setDate(2, new Date(cart.getBuyDate().getTime()));
                ps.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        @Override
        public void edit(Cart cart) {
            String sql = "UPDATE cart SET id_user = ?, buyDate = ? WHERE id = ?";
            Connection con = JDBCConnection.getJDBCConnection();
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, cart.getUser().getId());
                ps.setDate(2, new Date(cart.getBuyDate().getTime()));
                ps.setString(3, cart.getId());
                ps.executeUpdate();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        @Override
        public void delete(int id) {
            String sql = "DELETE FROM cart WHERE id = ?";
            Connection con = JDBCConnection.getJDBCConnection();
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                ps.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        @Override
        public Cart get(String username) {
            String sql = "SELECT cart.id, cart.buyDate, User.email, user.username, user.id AS user_id "
                    + "FROM cart INNER JOIN user " + "ON cart.id_user = user.id WHERE cart.id=?";
            Connection con = JDBCConnection.getJDBCConnection();

            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, username);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    User user = userService.get(rs.getString("user_username"));
                    Cart cart = new Cart();
                    cart.setId(rs.getString("id"));
                    cart.setBuyDate(rs.getDate("buyDate"));
                    cart.setUser(user);
                    return cart;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return null;
        }

    @Override
        public Cart get(int id) {
        String sql = "SELECT cart.id, cart.buyDate, User.email, user.username, user.id AS user_id "
                + "FROM cart INNER JOIN user " + "ON cart.id_user = user.id WHERE cart.id=?";
        Connection con = JDBCConnection.getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userService.get(rs.getInt("user_id"));

                Cart cart = new Cart();
                cart.setId(rs.getString("id"));
                cart.setBuyDate(rs.getDate("buyDate"));
                cart.setUser(user);
                return cart;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
        @Override
        public List<Cart> getAll() {
            List<Cart> cartList = new ArrayList<Cart>();
            String sql = "SELECT cart.id, cart.buyDate, User.email, user.username, user.id AS user_id "
                    + "FROM cart INNER JOIN user " + "ON cart.id_user = user.id";
            Connection con = JDBCConnection.getJDBCConnection();

            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    User user = userService.get(rs.getInt("user_id"));

                    Cart cart = new Cart();
                    cart.setId(rs.getString("id"));
                    cart.setBuyDate(rs.getDate("buyDate"));
                    cart.setUser(user);

                    cartList.add(cart);

                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return cartList;
        }

    @Override
        public List<Cart> search(String keyword) {
        List<Cart> cartList = new ArrayList<Cart>();
        String sql = "SELECT cart.id, cart.buyDate, User.email, user.username, user.id AS user_id "
                + "FROM cart INNER JOIN user " + "ON cart.id_user = user.id LIKE User.email = ?";
        Connection con = JDBCConnection.getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = userService.get(rs.getInt("user_id"));
                Cart cart = new Cart();
                cart.setId(rs.getString("id"));
                cart.setBuyDate(rs.getDate("buyDate"));
                cart.setUser(user);
                cartList.add(cart);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cartList;
    }
}
