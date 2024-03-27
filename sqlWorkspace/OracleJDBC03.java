package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class OracleJDBC03 {

   public static void main(String[] args) throws ClassNotFoundException, SQLException {
      System.out.println("===== JDBC (pstmt) =====");
      //JDBC 드라이버 로딩
      String driver = "oracle.jdbc.driver.OracleDriver";
      Class.forName(driver);
      //데이터베이스 연결 정보 준비
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String id = "C##KH";
      String pwd = "1234";
      
      //데이터베이스 연결 == 커넥션 객체 얻기
      Connection conn = DriverManager.getConnection(url, id, pwd);
      //유저입력받기
      Scanner sc = new Scanner(System.in);
      System.out.println("ID : ");
      String inputId = sc.nextLine();
      System.out.println("PWD : ");
      String inputPwd = sc.nextLine();
   
      
      //SQL 준비
      String sql= "SELECT * FROM MEMBER WHERE ID = ? AND PWD = ?";
      //SQL 실행을 위한 statement 준비
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, inputId);
      pstmt.setString(2, inputPwd);
      //statement 에 SQL 담아주고 실행 및 결과 리턴받기
      ResultSet rs = pstmt.executeQuery();
      //결과 출력
      if(rs.next()) {
         String dbId = rs.getString("ID");
         String dbPwd = rs.getString("PWD");
         String dbNick = rs.getString("NICK");
         
         MemberVo mV = new MemberVo(dbId, dbPwd, dbNick);
         System.out.println(mV);
      }
      //사용한 자원 반납
      // ~~~~~
   }

}
