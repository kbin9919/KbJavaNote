package com.kh.app01.board.controller;

import annotation.KhAno;
import com.kh.app01.board.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("board")
public class BoardController {

    @GetMapping("list")
    public String list() {
        int x = 1/0;
        return "board/list";
    }

}
