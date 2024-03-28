package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import main.Main;
import util.JDBCTemplate;

public class BoardController {
   public void printMenu() throws Exception {
      System.out.println("----- BOARD -----");
      System.out.println("1. 게시글 작성");
      System.out.println("2. 게시글 목록 조회");
      System.out.println("3. 게시글 상세 조회");
      
      String num = Main.SC.nextLine();
      switch(num) {
      case "1" : writer(); break;
      case "2" : selectBoardList(); break;
      case "3" : selectBoardOne(); break;
      default : System.out.println("잘못된 입력입니다.");
      }
      
   }
   private void writer() throws Exception {
      if(Main.loginMember == null) {
         System.out.println("로그인 후 이용 가능합니다.");
         return;
      }
      Connection conn = JDBCTemplate.getConn();
      String sql = "INSERT INTO BOARD(NO, TITLE, CONTENT, WRITER_NO) VALUES(SEQ_BOARD_NO.NEXTVAL , ? , ?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      System.out.println("게시글 제목 입력");
      String title = Main.SC.nextLine();
      System.out.println("게시글 내용 입력");
      String content = Main.SC.nextLine();
      pstmt.setString(1, title);
      pstmt.setString(2, content);
      pstmt.setString(3, Main.loginMember.getNo());
      int result = pstmt.executeUpdate();
      
      if(result != 1) {
         System.out.println("게시글 작성 실패");
         return;
      }
      System.out.println("게시글 작성 성공");
   }


   private void selectBoardList() throws Exception {
      JDBCTemplate.getConn();
      
   }
   
   private void selectBoardOne() throws Exception {
      JDBCTemplate.getConn();
   }
   

}
