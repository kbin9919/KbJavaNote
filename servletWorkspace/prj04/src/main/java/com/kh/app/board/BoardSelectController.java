package com.kh.app.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/select")
public class BoardSelectController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   BoardDao dao = new BoardDao();
	   List<BoardVo> voList = new ArrayList<BoardVo>();
	try {
		voList = dao.selectBoardList();
	} catch (Exception e) {
		e.printStackTrace();
	}
	  req.setAttribute("voList", voList);
      req.getRequestDispatcher("/WEB-INF/views/board/select.jsp").forward(req, resp);
   }
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
   }
}