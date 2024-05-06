package com.kb.app.admin.service;

import static com.kb.app.admin.db.JDBCTemplate.close;
import static com.kb.app.admin.db.JDBCTemplate.commit;
import static com.kb.app.admin.db.JDBCTemplate.getConnection;
import static com.kb.app.admin.db.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kb.app.admin.dao.AdminDao;
import com.kb.app.admin.vo.AdminVo;
import com.kb.app.admin.vo.BoardVo;

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

	public List<BoardVo> selectBoardList() throws Exception {
		
		Connection conn = getConnection();
		List<BoardVo> boardVoList = adminDao.selectBoardList(conn);
		
		close(conn);
		
		return boardVoList;
		
	}

	public BoardVo detailBoard(String getTitle) throws Exception {
		Connection conn = getConnection();
		BoardVo  boardVo = adminDao.detailBoard(conn, getTitle);
		
		close(conn);
		
		return boardVo;
	}

}
