package com.kh.app03.board.controller;

import com.kh.app03.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;
    @ResponseBody
    @GetMapping("list")
    public String boardList(){
        service.list();
        return "list";
    }


}
