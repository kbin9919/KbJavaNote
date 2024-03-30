package phone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.Util;

public class PhoneInfo {
	
	public void phoneInfo() {
		try {
			if(Util.mvo == null) {
				System.out.println("로그인 후 이용해주세요.");
				return;
			}
			System.out.println("중고폰 가격 조회");
			Connection conn = Util.getConn();
			String sql = "SELECT PHONE_NAME, GRADE, CAPACITY, SELL_PRICE FROM PHONE";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			PhoneVo vo = null;
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String phoneName = rs.getString("PHONE_NAME");
				String grade = rs.getString("GRADE");
				String capacity = rs.getString("CAPACITY");
				String sellPhone = rs.getString("SELL_PRICE");
				
				vo = new PhoneVo(phoneName, grade, capacity, sellPhone);
				Util.phoneList.add(vo);
			}
			if(vo == null) {
				System.out.println("중고폰 가격 조회 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
