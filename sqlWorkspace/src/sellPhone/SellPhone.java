package sellPhone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.Util;

public class SellPhone {
	public void sellPhone() {
		try {
			if (Util.mvo == null) {
				System.out.println("로그인 후 이용해주세요.");
				return;
			}
			int score = 100;
			String grade = "";
			String price = "";
			Connection conn = Util.getConn();
			String sql = "INSERT INTO BUY_LIST(NO, MEMBER_ID, PHONE_MODEL, BREAK_YN, BATTERY, GRADE, CAPACITY, PRICE) VALUES(BUY_LIST_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";

			System.out.println("기종 : ");
			String phoneModel = Util.SC.nextLine();
			System.out.println("파손여부(Y/N) : ");
			String breakYn = Util.SC.nextLine();
			System.out.println("패터리 성능 : ");
			String battery = Util.SC.nextLine();
			System.out.println("용량 : ");
			String capacity = Util.SC.nextLine();

			if (breakYn.equals("Y")) {
				score -= 10;
			}
			int batterys = Integer.parseInt(battery);
			if (batterys >= 80 && batterys < 90) {
				score -= 10;
			} else if (batterys >= 70 && batterys < 80) {
				score -= 20;
			} else if (batterys >= 60 && batterys < 70) {
				score -= 30;
			} else if (batterys >= 50 && batterys < 60) {
				score -= 40;
			}

			if (score >= 90) {
				grade = "A";
			} else if (score >= 80 && score < 90) {
				grade = "B";
			} else if (score >= 70 && score < 80) {
				grade = "C";
			} else if (score >= 60 && score < 70) {
				grade = "D";
			} else if (score >= 50 && score < 60) {
				grade = "E";
			}

			for (int i = 0; i < Util.phoneList.size(); i++) {
				if (Util.phoneList.get(i).getPhone_name().contains("IPHONE")) {
					if (Util.phoneList.get(i).getPhone_name().contains("15")) {
						if (Util.phoneList.get(i).getCapacity().contains("128")) {
							if (grade.equals("A") && Util.phoneList.get(i).getGrade().equals("A")) {
								price = Util.phoneList.get(i).getSell_price();
							} else if (grade.equals("B") && Util.phoneList.get(i).getGrade().equals("B")) {
								price = Util.phoneList.get(i).getSell_price();
							} else if (grade.equals("C") && Util.phoneList.get(i).getGrade().equals("C")) {
								price = Util.phoneList.get(i).getSell_price();
							} else if (grade.equals("D") && Util.phoneList.get(i).getGrade().equals("D")) {
								price = Util.phoneList.get(i).getSell_price();
							} else if (grade.equals("E") && Util.phoneList.get(i).getGrade().equals("E")) {
								price = Util.phoneList.get(i).getSell_price();
							}
						}
					}
				}
			}

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Util.mvo.getId());
			pstmt.setString(2, phoneModel);
			pstmt.setString(3, breakYn);
			pstmt.setString(4, battery);
			pstmt.setString(5, grade);
			pstmt.setString(6, capacity);
			pstmt.setString(7, price);

			int result = pstmt.executeUpdate();
			if (result != 1) {
				throw new RuntimeException("중고폰 판매 실패.");
			}

			System.out.println("중고폰 판매 성공.");

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
