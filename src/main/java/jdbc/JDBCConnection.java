package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/web_shop_case_m3";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "blue123@";

    public static Connection getJDBCConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // khai bao driver cho mysql
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Connect Successful");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
