package main;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTemplate {
    public static Connection getConnection() throws Exception {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String id = "C##KB";
        String pwd = "1234";
        Connection conn = DriverManager.getConnection(url, id, pwd);
        return conn;
    }
}
