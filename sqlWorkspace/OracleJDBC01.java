package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class OracleJDBC01 {

   public static void main(String[] args) throws Exception {

      System.out.println("====JDBC====");
      Scanner sc = new Scanner(System.in);
      String a = sc.nextLine();
      String b = sc.nextLine();
      String c = sc.nextLine();
      // jdbc 드라이버 로딩 : Oracle JDBC 드라이버 클래스를 로드합니다. 이것은 오라클 데이터베이스에 연결하기 위해 필요한 드라이버
      // 클래스를 JVM에 로드하는 역할을 합니다.
      Class.forName("oracle.jdbc.driver.OracleDriver");

      // 데이터베이스 연결 정보 준비 : 데이터베이스 연결 정보를 준비합니다.
      String ur1 = "jdbc:oracle:thin:@localhost:1521:xe"; // Oracle 데이터베이스에 연결하기 위한 JDBC URL입니다.
      String id = "C##KH"; // 데이터베이스 사용자 ID입니다.
      String pwd = "1234"; // 데이터베이스 사용자 비밀번호입니다.

      // 데이터베이스 연결 : JDBC 드라이버 매니저를 사용하여 데이터베이스에 연결합니다. 연결 정보로는 JDBC URL, 사용자 ID,
      // 비밀번호를 사용합니다.
      Connection conn = DriverManager.getConnection(ur1, id, pwd);

      // SQL 준비 : 실행할 SQL 문을 준비합니다. 여기서는 회원 테이블에 새로운 회원 정보를 삽입하는 INSERT 문입니다.
      String sql = "INSERT INTO MEMBER(ID,PWD,NICK) VALUES('" + a + "','"+ b +"','"+ c +"')";
//      String sql = "UPDATE MEMBER SET PWD = '0000'";
//      String sql = "DELETE MEMBER";
      

      // SQL 실행을 위한 statement 준비 : SQL 문을 실행하기 위한 Statement 객체를 생성합니다.
      Statement stmt = conn.createStatement();

      // statement에 SQL 담아주고 실행 및 결과 리턴받기 : 준비된 SQL 문을 실행하고, 영향을 받은 레코드의 수를 반환합니다.
      // 여기서는 INSERT 문이 실행되어 삽입된 레코드 수를 반환합니다.
      int result = stmt.executeUpdate(sql);

      // 결과 출력 : 쿼리 실행 결과를 출력합니다. 여기서는 INSERT 문이 실행된 후 영향을 받은 레코드 수를 출력합니다.
      System.out.println("insert 쿼리문 실행 결과 : " + result);

      // 사용한 자원 반납
      // ~~~~~

   }

}
