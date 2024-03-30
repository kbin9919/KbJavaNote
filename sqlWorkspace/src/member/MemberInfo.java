package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import sellPhone.SellPhoneVo;
import util.Util;

public class MemberInfo {
	public void memberInfo() throws SQLException {
		System.out.println("회원 정보 조회");
		Connection conn = Util.getConn();
		String sql = "SELECT * FROM BUY_LIST WHERE MEMBER_ID = ?";
		PreparedStatement pstmt =conn.prepareStatement(sql);
		pstmt.setString(1, Util.mvo.getId());
		
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String memberId = rs.getString("MEMBER_ID");
			String no = rs.getString("NO");
			String sellDate = rs.getString("SELL_DATE");
			String phoneModel = rs.getString("PHONE_MODEL");
			String price = rs.getString("PRICE");
			String breakYn = rs.getString("BREAK_YN");
			String battery = rs.getString("BATTERY");
			String grade = rs.getString("GRADE");
			String capacity = rs.getString("CAPACITY");
			
			SellPhoneVo vo = new SellPhoneVo(memberId, no, sellDate, phoneModel, price, breakYn, battery, grade, capacity);
			System.out.println(vo);
		}
	}
}
