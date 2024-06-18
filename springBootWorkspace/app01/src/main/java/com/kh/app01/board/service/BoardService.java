package com.kh.app01.board.service;

import com.kh.app01.board.dao.BoardDao;
import com.kh.app01.board.vo.BoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardDao dao;

    public int write(BoardVo vo) {
        return dao.write(vo);
    }

    public List<BoardVo> getBoardList() {
        return dao.getBoardList();
    }

    public List<BoardVo> searchBaordList(Map<String, String> paramMap) {
        return dao.searchBaordList(paramMap);
    }

}