package com.kb.app.admin.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.app.admin.service.AdminService;

@WebServlet("/admin/warning")
public class AdminWarningController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/member/warning.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String warningNo = req.getParameter("warningNo");
			String email = req.getParameter("email");
			System.out.println(warningNo);
			System.out.println(email);
			AdminService as = new AdminService();
			int result = as.warning(warningNo, email);
			System.out.println(result);
			if (result == 1) {
				System.out.println("조건문 통과");
				req.setAttribute("resultMsg", "경고 성공!");
				req.getRequestDispatcher("/WEB-INF/views/common/result.jsp").forward(req, resp);
			} else {
				throw new Exception("경고 실패..");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			req.setAttribute("errMsg", "경고 실패 에러 발생!");
			req.getRequestDispatcher("/WEB-INF/views/common/error,jsp");
		}

	}
}
