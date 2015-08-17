package com.hanyang.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanyang.tour.model.ReplyDto;
import com.hanyang.tour.model.dao.ReplyDao;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}
	
	private void execute(HttpServletRequest request, HttpServletResponse response){
		ReplyDto mdto = new ReplyDto();
		mdto.setUser(request.getParameter("user"));
		System.out.println(request.getParameter("user"));
		mdto.setId(Integer.parseInt(request.getParameter("pid")));
		mdto.setComment(request.getParameter("comment"));
		
		int update = ReplyDao.getMemberDao().update(mdto);
		
	}

}
