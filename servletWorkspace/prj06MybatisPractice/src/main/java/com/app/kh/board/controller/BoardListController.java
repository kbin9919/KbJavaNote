package com.app.kh.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.kh.board.service.BoardService;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardService bs = new BoardService();
			List voList = bs.getBoardList();
			PrintWriter out = resp.getWriter();
			out.write("voList : " + voList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
