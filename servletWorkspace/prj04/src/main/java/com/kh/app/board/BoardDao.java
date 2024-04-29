package com.kh.app.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.db.JDBCTemplate;

public class BoardDao {

	public int insert(BoardVo vo) throws Exception {
		// conn

		Connection conn = JDBCTemplate.getConn();

		// SQL
		String sql = "INSERT INTO BOARD(TITLE, CONTENT) VALUES(?,?)";
		// pstmt
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getTitle());
		pstmt.setString(2, vo.getContent());
		int result = pstmt.executeUpdate();

		// result
		if (result == 1) {
			conn.commit();
		}

		return result;
	}

	public List<BoardVo> selectBoardList() throws Exception {
		Connection conn = JDBCTemplate.getConn();

		String sql = "SELECT * FROM BOARD";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<BoardVo> voList = new ArrayList<BoardVo>();
		while (rs.next()) {
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");

			BoardVo vo = new BoardVo();
			vo.setTitle(title);
			vo.setContent(content);
			voList.add(vo);
		}
		return voList;
	}
}