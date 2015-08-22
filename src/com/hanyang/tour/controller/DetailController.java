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

import com.hanyang.tour.model.PlaceDto;
import com.hanyang.tour.model.ReplyDto;
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
		String root = request.getContextPath();
		String place = request.getParameter("place");
		String path = "/index.jsp";
		List<ReplyDto> list = ReplyDao.getMemberDao().list(place);
		PlaceDto pDto = PlaceDao.getMemberDao().getPdto(place);
		
		path="/page-detail.jsp";
		request.setAttribute("mlist", list);
		request.setAttribute("pname", pDto.getPlace());
		request.setAttribute("pid", pDto.getId());
		request.setAttribute("pimg", pDto.getImg());	
		RequestDispatcher disp  = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

}
