package com.kb.app.admin.dao;

import static com.kb.app.admin.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.kb.app.admin.vo.AdminVo;

public class AdminDao {

	public AdminVo login(Connection conn, AdminVo adminVo) throws Exception {
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? AND PASSWORD = ? AND AUTHORITY = 'Y'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, adminVo.getEmail());
		pstmt.setString(2, adminVo.getPassword());
		
		ResultSet rs = pstmt.executeQuery();
		
		AdminVo newAdminVo = null;
		if(rs.next()) {
			String adminEmailId = rs.getString("EMAIL");
			String adminPwd = rs.getString("PASSWORD");
			String adminNick = rs.getString("NICK");
			
			newAdminVo = new AdminVo();
			newAdminVo.setEmail(adminEmailId);
			newAdminVo.setPassword(sql);
			newAdminVo.setNick(adminNick);
		}
		close(rs);
		close(pstmt);
		return newAdminVo;
	}

}
