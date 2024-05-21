package com.app.kh.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.app.kh.board.vo.BoardVo;

public class BoardDao {

	public int insertBoard(SqlSession ss, BoardVo vo) {
		return ss.insert("boardMapper.writer", vo);
	}

	public List getBoardList(SqlSession ss) {
		// TODO Auto-generated method stub
		return ss.selectList("boardMapper.boardList");
	}
	
}
