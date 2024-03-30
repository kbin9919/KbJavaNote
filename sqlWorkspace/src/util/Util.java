package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import member.MemberVo;
import phone.PhoneVo;

public class Util {
	public static final Scanner SC = new Scanner(System.in);
	public static MemberVo mvo = null;
	public static ArrayList<PhoneVo> phoneList = new ArrayList<PhoneVo>();
	public static final Connection getConn() {
		Connection conn = null;
		
		try {
			String driver = "oracle.jdbc.driver.OracleDriver";
			Class.forName(driver);
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "C##KB";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, id, pwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
