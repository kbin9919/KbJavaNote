package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import main.Main;
import util.JDBCTemplate;

public class MemberController {
   public void printMenu() throws Exception {
      System.out.println("----- member -----");
      System.out.println("1. 회원가입");
      System.out.println("2. 로그인");
      System.out.println("원하는 메뉴 번호 입력");
      String num = Main.SC.nextLine();
      switch(num) {
      case "1" : join(); break;
      case "2" : login(); break;
      default : System.out.println("잘못된 입력입니다.");
      }
   }
   
   private void join() throws Exception {
      Connection conn = JDBCTemplate.getConn(); 
      
      String sql = "INSERT INTO MEMBER(NO, ID, PWD, NICK) VALUES (SEQ_MEMBER_NO.NEXTVAL , ?, ?, ?)"; 
      PreparedStatement pstmt = conn.prepareStatement(sql);
      System.out.println("ID : ");
      String inputId = Main.SC.nextLine();
      System.out.println("Pwd : ");
      String inputPwd = Main.SC.nextLine();
      System.out.println("Nick : ");
      String inputNick = Main.SC.nextLine();
      
      pstmt.setString(1, inputId);
      pstmt.setString(2, inputPwd);
      pstmt.setString(3, inputNick);
      
      int result = pstmt.executeUpdate();
      if(result != 1) {
         System.out.println("실패");
         return;
      }
      System.out.println("성공");
   }
   private void login() throws Exception {
      Connection conn = JDBCTemplate.getConn();
      String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PWD = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      System.out.println("ID : ");
      String inputId = Main.SC.nextLine();
      System.out.println("Pwd : ");
      String inputPwd = Main.SC.nextLine();
      
      
      pstmt.setString(1, inputId);
      pstmt.setString(2, inputPwd);
      
      ResultSet rs = pstmt.executeQuery();
      MemberVo vo = null;
      while(rs.next()) {
         String dbNo = rs.getString("NO");
         String dbId = rs.getString("ID");
         String dbPwd = rs.getString("PWD");
         String dbNick = rs.getString("Nick");
         String enrollDate = rs.getString("ENROLL_DATE");
         String modifyDate = rs.getString("MODIFY_DATE");
         String quitYn = rs.getString("QUIT_YN");
         vo = new MemberVo(dbNo, dbId, dbPwd, dbNick, enrollDate, modifyDate, quitYn);
      }
      if(vo == null) {
         System.out.println("실패!");
      }
      System.out.println("로그인 성공!");
      System.out.println(vo.getNick() + "님 환영합니다. ");
      Main.loginMember = vo;
      
      
   }
   
}