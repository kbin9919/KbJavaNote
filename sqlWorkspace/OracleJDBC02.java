package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class OracleJDBC02 {

   public static void main(String[] args) throws Exception {
      System.out.println("====JDBC (SELECT)====");
      // JDBC 드라이버 로딩
      String str = "oracle.jdbc.driver.OracleDriver";
      Class.forName(str);
      // 데이터베이스 연결 정보 준비
      String ur1 = "jdbc:oracle:thin:@localhost:1521:xe";
      String id = "C##KH";
      String pwd = "1234";
      // 데이터베이스 연결 == 커넥션 객체 얻기
      Connection conn = DriverManager.getConnection(ur1, id, pwd);
      // SQL 준비
      String sql = "SELECT * FROM MEMBER";
      // SQL 실행을 위한 statement 준비
      Statement stmt = conn.createStatement();
      // statement 에 SQL 담아주고 실행 및 결과 리턴받기
      ResultSet rs = stmt.executeQuery(sql);
      // 결과 출력
      /*
       * rs.next() = 커서 이동 
       * rs.get자료형("칼럼명") = ResultSet 반환
       */
      System.out.println(rs);
      while(rs.next()) {
         String id1 = rs.getString("ID");
         String pwd1 = rs.getString("PWD");
         String nick1 = rs.getString("NICK");
         MemberVo mV = new MemberVo(id1, pwd1, nick1);
         System.out.println(mV);
      }
            // 사용한 자원 반납

      // ~~~~~
   }

}
