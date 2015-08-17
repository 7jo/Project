package com.hanyang.tour.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanyang.tour.model.dao.MemberDao;

/**
 * Servlet implementation class ValidationCheckController
 */
@WebServlet("/validation")
public class ValidationCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		System.out.println("email: "+email);
		int cnt = MemberDao.getMemberDao().emailCheck(email);
		System.out.println("검색갯수: "+ cnt);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(cnt);
	}

}
