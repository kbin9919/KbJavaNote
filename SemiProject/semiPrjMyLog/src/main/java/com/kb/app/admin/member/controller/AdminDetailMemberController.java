package com.kb.app.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.app.admin.service.AdminService;
import com.kb.app.admin.vo.MemberVo;

@WebServlet("/admin/detail/member")
public class AdminDetailMemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/member/detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			String getEmail = req.getParameter("email");
			AdminService adminService = new AdminService();
			MemberVo memberVo = adminService.detailMember(getEmail);

			req.setAttribute("memberVo", memberVo);
			req.getRequestDispatcher("/WEB-INF/views/admin/member/detail.jsp").forward(req, resp);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			session.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	}
}
