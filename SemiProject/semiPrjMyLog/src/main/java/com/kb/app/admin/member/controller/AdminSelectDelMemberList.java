package com.kb.app.admin.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kb.app.admin.service.AdminService;
import com.kb.app.admin.vo.MemberVo;

@WebServlet("/admin/select/del/member")
public class AdminSelectDelMemberList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		try {
			AdminService adminService = new AdminService();
			List<MemberVo> delMemberVoList = adminService.selectDelMemberList();

			req.setAttribute("delMemberVoList", delMemberVoList);
			req.getRequestDispatcher("/WEB-INF/views/admin/delMember/select.jsp").forward(req, resp);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			session.setAttribute("errMsg", e.getMessage());
			req.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
