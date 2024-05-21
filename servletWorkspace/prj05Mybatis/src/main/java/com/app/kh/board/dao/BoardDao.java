package com.app.kh.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.app.kh.board.vo.BoardVo;

public class BoardDao {
	public int insertBoard(SqlSession ss, BoardVo vo) {
		return ss.insert("BoardMapper.write", vo);
	}

	public List<BoardVo> getBoardList(SqlSession ss) {
		return ss.selectList("BoardMapper.getBoardList");
	}

}
