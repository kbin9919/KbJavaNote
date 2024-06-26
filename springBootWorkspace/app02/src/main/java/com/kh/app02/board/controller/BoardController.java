package com.kh.app02.board.controller;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@AllArgsConstructor
@RequestMapping("board")
public class BoardController {

    @GetMapping("list")
    public String list(Model model) {
        System.out.println("BoardController.list");
        model.addAttribute("k01","v01");
        return "board/list";
    }


}
