package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.Util;

public class MemberController {
	public void printMenu() throws Exception {
		System.out.println("1. 로그인");
		System.out.println("2. 아직 회원이 아니신가요?");
		String num = Util.SC.nextLine();
		switch(num) {
		case "1" : login(); break;
		case "2" : join(); break;
		default : System.out.println("잘못된 입력 입니다. 다시 입력해 주세요."); return;
		}
	}
	private void login() throws Exception {
		
		try {
			Connection conn = Util.getConn();
			String sql = "SELECT NO, ID, PWD, BANK_ACCOUNT_NUMBER FROM MEMBER WHERE ID = ? AND PWD = ?";
			
			System.out.println("아이디 : ");
			String id = Util.SC.nextLine();
			System.out.println("비밀번호 : ");
			String pwd = Util.SC.nextLine();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbNo = rs.getString("NO");
				String dbId = rs.getString("ID");
				String dbPwd = rs.getString("PWD");
				String dbBankAccountNumber = rs.getString("BANK_ACCOUNT_NUMBER");
				Util.mvo = new MemberVo(dbNo, dbId, dbPwd, dbBankAccountNumber);
			}
			if(Util.mvo == null) {
				throw new Exception("로그인 실패");
			}
			System.out.println("로그인 성공! " + Util.mvo.getId() + "님 환영합니다. :)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	private void join() {
		
		try {
			Connection conn = Util.getConn();
			String sql = "INSERT INTO MEMBER(NO, ID, PWD, BANK_ACCOUNT_NUMBER) VALUES (SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?)";
			System.out.println("아이디 : ");
			String id  = Util.SC.nextLine();
			System.out.println("비밀번호 : ");
			String pwd  = Util.SC.nextLine();
			System.out.println("계좌번호 : ");
			String bankAccountNumber  = Util.SC.nextLine();
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, bankAccountNumber);
			
			int result = pstmt.executeUpdate();
			if(result != 1) {
				throw new RuntimeException("회원가입 실패.");
			}
			System.out.println("회원가입 성공.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
