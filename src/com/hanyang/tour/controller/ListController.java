package com.hanyang.tour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String position_name = request.getParameter("title");
//		ArrayList<String> list = new ArrayList<String>();
//		
//		if(position_name.equals("bm_house")){	list.add("bm_house");
//			list.add("yh_house");
//			list.add("cha_house");
//		}else if(position_name.equals("yh_house")){
//			list.add("yh_house");
//			list.add("cha_house");
//			list.add("bm_house");			
//		}else if(position_name.equals("cha_house")){
//			list.add("cha_house");
//			list.add("bm_house");
//			list.add("yh_house");
//		}

		String list = position_name+"->cha_house->yh_house";
		PrintWriter out = response.getWriter();
		out.print(list);
		//session.setMaxInactiveInterval(60*30); // default is 30 seconds; 60*1 = 60 seconds 	
			
	}

}
