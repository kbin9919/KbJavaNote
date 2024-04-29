package com.kh.app.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/insert")
public class BoardInsertController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/board/insert.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		BoardVo vo = new BoardVo();
		vo.setTitle(title);
		vo.setContent(content);

		int result = 0;

		try {
			BoardDao dao = new BoardDao();
			result = dao.insert(vo);
		} catch (Exception e) {
			System.out.println("게시글 작성 실패");
			e.printStackTrace();
		}
		
		if (result == 1) {
			req.setAttribute("msg", "게시글 작성 성공!");
		} else {
			req.setAttribute("msg", "게시글 작성 실패..");
		}
		req.getRequestDispatcher("/WEB-INF/views/common/result.jsp").forward(req, resp);
	}
}