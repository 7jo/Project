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

import com.hanyang.tour.model.NoticeDto;
import com.hanyang.tour.model.dao.NoticeDao;

/**
 * Servlet implementation class NoticeController
 */
@WebServlet("/notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String act;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		act = request.getParameter("act");
		String path;
		if (act == null) {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("email");
			path = "/page-notice.jsp";
			List<NoticeDto> list = NoticeDao.getMemberDao().list();
			if (id != null && id.equals("root")) {
				path = "/page-notice-admin.jsp";
			}
			request.setAttribute("mlist", list);
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}
		else{
			request.setCharacterEncoding("UTF-8");
			path = "/page-notice-check.jsp";
			String contents = request.getParameter("contents");
			int insert = 0;
			if (act.equals("add")) {
				if(!contents.equals(""))
					insert = NoticeDao.getMemberDao().insert(contents);
				request.setAttribute("check", insert);
				request.setAttribute("contents", contents);
			} else if (act.equals("mod")) {
				int id = Integer.parseInt(request.getParameter("id"));
				NoticeDto nDto = new NoticeDto();
				nDto.setId(id);
				nDto.setContents(contents);
				if(!contents.equals(""))
					insert = NoticeDao.getMemberDao().update(nDto);
				request.setAttribute("contents", contents);
				request.setAttribute("check", insert);
			} else if (act.equals("del")) {
				int id = Integer.parseInt(request.getParameter("id"));
				insert = NoticeDao.getMemberDao().delete(id);
				request.setAttribute("check", insert);
			}
			request.setAttribute("act", act);
			RequestDispatcher disp  = request.getRequestDispatcher(path);
			disp.forward(request, response);
		}

	}

}
