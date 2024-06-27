package com.kh.app03.board.service;

import com.kh.app03.board.dao.BoardDao;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardDao dao;

    public void list(){
        System.out.println("BoardService");
        dao.list();
    }
}
