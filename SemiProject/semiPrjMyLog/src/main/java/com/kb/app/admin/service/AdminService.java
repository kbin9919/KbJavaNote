package com.kb.app.admin.service;

import static com.kb.app.admin.db.JDBCTemplate.close;
import static com.kb.app.admin.db.JDBCTemplate.commit;
import static com.kb.app.admin.db.JDBCTemplate.getConnection;
import static com.kb.app.admin.db.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kb.app.admin.dao.AdminDao;
import com.kb.app.admin.vo.AdminVo;

public class AdminService {
	private AdminDao adminDao;

	public AdminService() {
		adminDao = new AdminDao();
	}

	public AdminVo login(AdminVo adminVo) throws Exception {
		// 비즈니스 로직

		// JDBC
		Connection conn = getConnection();

		AdminVo newAdminVo = adminDao.login(conn, adminVo);

		close(conn);
		return newAdminVo;
	}

}
