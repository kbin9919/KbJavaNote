package com.kb.app.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.app.admin.service.AdminService;
import com.kb.app.admin.vo.AdminVo;

@WebServlet("/admin/login")
public class AdminLoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			// 데이터 꺼내오기
			String adminEmailId = req.getParameter("id");
			String adminPwd = req.getParameter("pwd");

			// 데이터 뭉치기
			AdminVo adminVo = new AdminVo();
			adminVo.setEmail(adminEmailId);
			adminVo.setPassword(adminPwd);
			// 로그인 메소드 호출
			AdminService adminService = new AdminService();
			AdminVo newAdminVo = adminService.login(adminVo);
			if (newAdminVo != null) {
				session.setAttribute("alertMsg", "로그인 성공!");
				session.setAttribute("newAdminVo", newAdminVo);
			} else {
				session.setAttribute("alertMsg", "로그인 실패..");
			}
			resp.sendRedirect("/MyLog/home");

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			session.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}

	}
}
