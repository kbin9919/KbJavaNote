package com.kb.app.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.app.admin.service.AdminService;
import com.kb.app.admin.vo.MemberVo;

@WebServlet("/admin/quit/member")
public class AdminQuitMember extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/member/quit.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String getEmail = req.getParameter("email");
			AdminService adminService = new AdminService();
			int result = adminService.quitMember(getEmail);
			
			req.setAttribute("resultMsg", "계정 제제 성공!");
			req.getRequestDispatcher("/WEB-INF/views/common/result.jsp").forward(req, resp);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
		
	}
}
