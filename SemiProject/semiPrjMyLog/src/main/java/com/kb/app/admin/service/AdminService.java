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
import com.kb.app.admin.vo.MemberVo;

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
		BoardVo boardVo = adminDao.detailBoard(conn, getTitle);

		close(conn);

		return boardVo;
	}

	public List<BoardVo> selectDelBoardList() throws Exception {
		Connection conn = getConnection();
		List<BoardVo> boardVoList = adminDao.selectDelBoardList(conn);

		close(conn);

		return boardVoList;
	}

	public BoardVo detailDelBoard(String getTitle) throws Exception {
		Connection conn = getConnection();
		BoardVo delBoardVo = adminDao.detailDelBoard(conn, getTitle);

		close(conn);

		return delBoardVo;
	}

	public List<MemberVo> selectMemberList() throws Exception {
		Connection conn = getConnection();
		List<MemberVo> memberVoList = adminDao.selectMemberList(conn);

		close(conn);

		return memberVoList;
	}

	public MemberVo detailMember(String getEmail) throws Exception {
		Connection conn = getConnection();
		MemberVo memberVo = adminDao.detailMember(conn, getEmail);

		close(conn);

		return memberVo;
	}

	public List<MemberVo> selectDelMemberList() throws Exception {
		Connection conn = getConnection();
		List<MemberVo> delMemberVoList = adminDao.selectDelMemberList(conn);

		close(conn);

		return delMemberVoList;
	}

	public MemberVo detailDelMember(String getEmail) throws Exception {
		Connection conn = getConnection();
		MemberVo delMemberVo = adminDao.detailDelMember(conn, getEmail);

		close(conn);

		return delMemberVo;
	}

	public int warning(String warningNo, String email) throws Exception {
		Connection conn = getConnection();
		System.out.println("서비스 넘어옴");
		int result = adminDao.warning(conn, warningNo, email);
		if (result == 1) {
			System.out.println("커밋됨");
			commit(conn);
		} else {
			System.out.println("롤백됨");
			rollback(conn);
		}
		
		close(conn);
		System.out.println("서비스 값 리턴");
		return result;
	}

	public int quitMember(String getEmail) throws Exception {
		Connection conn = getConnection();
		int result = adminDao.quitMember(conn, getEmail);
		if (result == 1) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

}
