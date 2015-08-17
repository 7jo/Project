package com.hanyang.tour.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanyang.tour.model.MemberDto;
import com.hanyang.tour.model.dao.MemberDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		MemberDto mdto = new MemberDto();
		mdto.setEmail(request.getParameter("ck_email"));
		mdto.setPwd(request.getParameter("ck_pwd"));
	
		
		int check = MemberDao.getMemberDao().check(mdto);
		
		if(check==0){
			String path="/page-login.jsp?islogin=false";
			
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}else{
			String path="/loginsucess.jsp";
			request.setAttribute("email", mdto.getEmail());
			request.setAttribute("pwd", mdto.getPwd());
			
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			
			disp.forward(request, response);
		}

	}

}
