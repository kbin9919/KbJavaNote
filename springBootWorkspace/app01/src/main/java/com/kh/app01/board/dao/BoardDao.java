package com.kh.app01.board.dao;

import com.kh.app01.board.mapper.BoardMapper;
import com.kh.app01.board.vo.BoardVo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class BoardDao {

    private final BoardMapper mapper;


    public int write(BoardVo vo) {
        return mapper.write(vo);
    }

    public List<BoardVo> getBoardList() {
        return mapper.getBaordList();
    }
    public List<BoardVo> searchBaordList(Map<String, String> paramMap) {
        return mapper.searchBaordList(paramMap);
    }
}
