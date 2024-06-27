package com.kh.app03.member.controller;

import com.kh.app03.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {

    private final MemberService service;

    @ResponseBody
    @GetMapping("list")
    public String memberList(){
        service.list();
        return "member list";
    }
}
