package util;


import java.sql.*;

public class util {

    private static String mysqlname = "subway";
    private static Connection con;
    private static Statement sta;
    private static ResultSet re;
    private static String coursename = "com.mysql.cj.jdbc.Driver";
    private static String url = "jdbc:mysql://localhost:3306/" + mysqlname + " ?serverTimezone=GMT%2B8";


    public static Connection getConnection() {
        try {
            Class.forName(coursename);
            System.out.println("连接成功");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(url, "root", "123456");
            System.out.println("LIANJIE");
        } catch (Exception e) {
            e.printStackTrace();
            con = null;
        }
        return con;
    }

    public static void close(Statement state, Connection conn) {
        if (state != null) {
            try {
                state.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void close(ResultSet rs, Statement state, Connection conn) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (state != null) {
            try {
                state.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
