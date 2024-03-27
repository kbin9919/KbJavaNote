package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import main.Main;

public class OracleJDBC04 {
   // "oracle.jdbc.driver.OracleDriver"
   // "jdbc:oracle:thin:@localhost:1521:xe"
// 1. printMenu 메소드 생성
   public void printMenu() throws ClassNotFoundException, SQLException {
      System.out.println("Member");
      System.out.println("1. 회원가입");
      System.out.println("2. 로그인");
      System.out.println("숫자를 입력하세요");
      String inputNum = Main.SC.nextLine();
      switch (inputNum) {
      case "1":
         join();
         break;
      case "2":
         login();
         break;
      default:
         System.out.println("잘못된입력");
      }
   }

   private void join() throws ClassNotFoundException, SQLException {
      System.out.println("회원가입");
      Connection conn = getConn();
      // 2.1) 입력받을 변수 준비
      System.out.println("ID : ");
      String inputId = Main.SC.nextLine();
      System.out.println("PWD : ");
      String inputPwd = Main.SC.nextLine();
      System.out.println("NICK : ");
      String inputNick = Main.SC.nextLine();
      // 2.2) sql준비
      String sql = "INSERT INTO MEMBER (ID, PWD, NICK) VALUES (?, ?, ?)";
      // 2.3) SQL 실행을 위한 statement 준비
      PreparedStatement pstmt = conn.prepareStatement(sql);
      // 2.4) statement 에 SQL 담아주고 실행 및 결과 리턴받기
      pstmt.setString(1, inputId);
      pstmt.setString(2, inputPwd);
      pstmt.setString(3, inputNick);
      int result = pstmt.executeUpdate();
      // 2.5) 결과 출력
      if(result != 1) {
         throw new RuntimeException("실패");
      }
      System.out.println("성공!");
   }

// 3. getConn 메소드 생성
   private Connection getConn() throws ClassNotFoundException, SQLException {
      // 3.1) 드라이버 준비
      String driver = "oracle.jdbc.driver.OracleDriver";
      Class.forName(driver);
      // 3.2) url,id,pwd 변수 생성
      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String id = "C##KH";
      String pwd = "1234";
      // 3.3) 커넥션 생성
      Connection conn = DriverManager.getConnection(url, id, pwd);
      // 3.4) 커넥션 반환
      return conn;
   }

// 4. login 메소드 생성
   private void login() throws ClassNotFoundException, SQLException {
      System.out.println("로그인");
      // 4.1) 커넥션 생성
      Connection conn = getConn();
      // 4.2) 입력받을 id, pwd 변수 생성
      System.out.println("ID : ");
      String inputId = Main.SC.nextLine();
      System.out.println("PWD : ");
      String inputPwd = Main.SC.nextLine();
      String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PWD = ?";
      // 4.3) statement 에 SQL 담아주기
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, inputId);
      pstmt.setString(2, inputPwd);
      // 4.4) 결과 반환받기
      ResultSet rs = pstmt.executeQuery();
      // 4.5) 결과 출력하기
      if(rs.next()) {
         System.out.println("성공!");
         String dbId = rs.getString("ID");
         String dbPwd = rs.getString("PWD");
         String dbNick = rs.getString("NICK");
         MemberVo mV = new MemberVo(dbId, dbPwd, dbNick);
         System.out.println(mV);
         
      }else {
         throw new RuntimeException("실패!");
      }

   }
}
