package com.kb.app.admin.dao;

import static com.kb.app.admin.db.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kb.app.admin.vo.AdminVo;
import com.kb.app.admin.vo.BoardVo;

public class AdminDao {

	public AdminVo login(Connection conn, AdminVo adminVo) throws Exception {
		String sql = "SELECT * FROM MEMBER WHERE EMAIL = ? AND PASSWORD = ? AND AUTHORITY = 'Y'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, adminVo.getEmail());
		pstmt.setString(2, adminVo.getPassword());

		ResultSet rs = pstmt.executeQuery();

		AdminVo newAdminVo = null;
		if (rs.next()) {
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

	public List<BoardVo> selectBoardList(Connection conn) throws Exception {
		String sql = "SELECT * FROM BOARD ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		List<BoardVo> boardVoList = new ArrayList<BoardVo>();
		while (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setWriter(writer);
			vo.setCategoryNo(categoryNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setSecretYn(secretYn);
			vo.setCreateDate(createDate);
			vo.setHits(hits);
			vo.setRecommend(recommend);
			vo.setNoticeYn(noticeYn);

			boardVoList.add(vo);
		}
		close(pstmt);
		close(rs);
		return boardVoList;
	}

	public BoardVo detailBoard(Connection conn, String getTitle) throws Exception {
		String sql = "SELECT * FROM BOARD WHERE TITLE = ? ORDER BY NO DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, getTitle);
		System.out.println(getTitle);
		ResultSet rs = pstmt.executeQuery();
		BoardVo boardVo = null;

		if (rs.next()) {
			String no = rs.getString("NO");
			String writer = rs.getString("WRITER");
			String categoryNo = rs.getString("CATEGORY_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String createDate = rs.getString("CREATE_DATE");
			String secretYn = rs.getString("SECRET_YN");
			String hits = rs.getString("HITS");
			String recommend = rs.getString("RECOMMEND");
			String noticeYn = rs.getString("NOTICE_YN");

			boardVo = new BoardVo();
			boardVo.setNo(no);
			boardVo.setWriter(writer);
			boardVo.setCategoryNo(categoryNo);
			boardVo.setTitle(title);
			boardVo.setContent(content);
			boardVo.setSecretYn(secretYn);
			boardVo.setCreateDate(createDate);
			boardVo.setHits(hits);
			boardVo.setRecommend(recommend);
			boardVo.setNoticeYn(noticeYn);

		}
		System.out.println(boardVo);
		close(pstmt);
		close(rs);
		return boardVo;
	}

}
