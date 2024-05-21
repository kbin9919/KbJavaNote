package com.app.kh.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.app.kh.board.dao.BoardDao;
import com.app.kh.board.db.SqlSessionTemplate;
import com.app.kh.board.vo.BoardVo;

public class BoardService {
	private static BoardDao dao;
	public BoardService() {
		this.dao = new BoardDao();
	}
	public int insertBoard(BoardVo vo) throws Exception {
		SqlSession ss = SqlSessionTemplate.getSession();
		int result = dao.insertBoard(ss, vo);
		
		if(result == 1) {
			ss.commit();
		}else {
			ss.rollback();
		}
			ss.close();
		
		return result;
	}
	public List<BoardVo> getBoardList() throws Exception {
		SqlSession ss = SqlSessionTemplate.getSession();
		List<BoardVo> voList =  dao.getBoardList(ss);
		ss.close();
		return voList;
	}

}
