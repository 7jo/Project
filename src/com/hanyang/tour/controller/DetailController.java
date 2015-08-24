package com.hanyang.tour.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hanyang.tour.model.Place2Dto;
import com.hanyang.tour.model.PlaceDto;
import com.hanyang.tour.model.ReplyDto;
import com.hanyang.tour.model.dao.Place2Dao;
import com.hanyang.tour.model.dao.PlaceDao;
import com.hanyang.tour.model.dao.ReplyDao;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
		
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		String path;
		if(request.getParameter("act")== null){
			String root = request.getContextPath();
			String place = request.getParameter("place");
			List<ReplyDto> list = ReplyDao.getMemberDao().list(place);
			Place2Dto pDto = Place2Dao.getMemberDao().getPdto(place);
			
			path="/page-detail.jsp";
			request.setAttribute("mlist", list);
			request.setAttribute("pname", pDto.getPlace());
			request.setAttribute("pid", pDto.getId());
			request.setAttribute("pimg", pDto.getImg());	
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
		else{
			HttpSession session = request.getSession();		
			
			String pname = (String)session.getAttribute("pname");
			String pid = (String)session.getAttribute("pid");
			String pimg = (String)session.getAttribute("pimg");
			
			String id = (String)session.getAttribute("email");
			String ck_date = request.getParameter("ck_date");
			String ck_user = request.getParameter("ck_user");
			System.out.println("session id: "+id+" ck_user : "+ck_user);
			if(ck_user.equals("root")||ck_user.equals(id)){
				ReplyDto mDto = new ReplyDto();
				mDto.setDate(ck_date);
				mDto.setPid(pid);
				mDto.setUser(ck_user);
				
				//int delete = ReplyDao.getMemberDao().delete(mDto);
				System.out.println(ck_date);
			}
			path="/page-detail.jsp";
			List<ReplyDto> list = ReplyDao.getMemberDao().list(pname);
			request.setAttribute("pname", pname);
			request.setAttribute("pid", pid);
			request.setAttribute("pimg", pimg);	
			request.setAttribute("mlist", list);
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			disp.forward(request, response);
			
		}
	}

}
