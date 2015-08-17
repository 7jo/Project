package com.hanyang.tour.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanyang.tour.model.MemberDto;
import com.hanyang.tour.model.ReplyDto;
import com.hanyang.tour.model.dao.MemberDao;
import com.hanyang.tour.model.dao.ReplyDao;

import sun.misc.Perf.GetPerfAction;

/**
 * Servlet implementation class RegisterMember
 */
@WebServlet("/register")
public class RegisterMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		execute(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response){
		MemberDto mdto = new MemberDto();
		mdto.setEmail(request.getParameter("email"));
		mdto.setPwd(request.getParameter("pwd"));
		mdto.setPwd2(request.getParameter("pwd2"));
		
		int signup = MemberDao.getMemberDao().signup(mdto);
		
	}

}

