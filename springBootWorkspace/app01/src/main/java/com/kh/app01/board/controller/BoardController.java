package com.kh.app01.board.controller;

import com.kh.app01.board.service.BoardService;
import com.kh.app01.board.vo.BoardVo;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("board")
public class BoardController {

    private final BoardService service;

    @GetMapping("test")
    public String BoardTest(){
        System.out.println("test");
        return "test";
    }

    @PostMapping("write")
    public int write(BoardVo vo){
        int result = service.write(vo);
        System.out.println("result : " + result);
        return result;
    }

    @GetMapping("list")
    public List<BoardVo> getBoardList(){
        List<BoardVo> voList = service.getBoardList();
        return voList;
    }
    @GetMapping("search")
    public List<BoardVo> searchBaordList(@RequestParam Map<String, String> paramMap){
        System.out.println("paramMap = " + paramMap);
        List<BoardVo> voList = service.searchBaordList(paramMap);
        return voList;
    }

}
