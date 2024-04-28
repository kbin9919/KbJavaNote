package com.kh.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class MemberLogin extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String memberPwd = req.getParameter("memberPwd");
		String msg = "";
		if("user01".equals(memberId) && "1234".equals(memberPwd)) {
			msg = "로그인 성공";
		}else {
			msg = "로그인 실패";
		}
		req.setAttribute("x", msg);
		req.getRequestDispatcher("/WEB-INF/views/member/result.jsp").forward(req, resp);
		
		
	}
}
