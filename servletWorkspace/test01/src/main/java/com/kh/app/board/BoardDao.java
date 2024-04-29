package com.kh.app.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.util.Util;

public class BoardDao {
	public int insert(BoardVo vo) throws Exception {
		Connection conn = Util.getConn();
		String sql = "INSERT INTO BOARD(TITLE, CONTENT) VALUES(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getTitle());
		pstmt.setString(2, vo.getContent());
		
		int result = pstmt.executeUpdate();
		if(result == 1) {
			conn.commit();
		}
		return result;
	}

	public List<BoardVo> getBoardVoList() throws Exception {
		Connection conn = Util.getConn();
		String sql = "SELECT * FROM BOARD";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		List<BoardVo> list = new ArrayList<BoardVo>();
		BoardVo vo = new BoardVo();
		while(rs.next()) {
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			vo.setTitle(title);
			vo.setContent(content);
			list.add(vo);
		}
		
		return list;
	}
}
