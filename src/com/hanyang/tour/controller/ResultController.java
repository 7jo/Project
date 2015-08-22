package com.hanyang.tour.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanyang.tour.model.Place2Dto;
import com.hanyang.tour.model.dao.Place2Dao;

/**
 * Servlet implementation class ResultController
 */
@WebServlet("/result")
public class ResultController extends HttpServlet {
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
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("test!!");
		
		String resultStart = "var hashmap = new Map(); ";
		String result = "";
		String place;
		String img;
		String key;
		String recpath;
		String lng;
		String lat;
		List<Place2Dto> list = Place2Dao.getMemberDao().list();
		for(int i = 0; i < list.size(); i++){
			place = list.get(i).getPlace();
			img = list.get(i).getImg();
			key = "place"+i;
			recpath = list.get(i).getPath();
			lat = list.get(i).getLat();
			lng = list.get(i).getLng ();
			result =result +"var "+key+"= new google.maps.LatLng("+lat+","+lng+");"
					+ "var contentString_"+i+" = '<img src=\"/Tour/img/"+img+".png\" style=\"width:200px;height:180px;\">"
							+ "<div></div><a href=\"/Tour/detail?place="+place+"\">Detail view</a>';"
					+ "var marker_"+i+" = new google.maps.Marker({"
							+ "position : "+key+","
							+ "map : map,"
							+ "title : '"+key+"'});"
					+ "var infowindow_"+i+" = new google.maps.InfoWindow({"
							+ "content: contentString_"+i+"});"
					+ "marker_"+i+".addListener('click', "
						+ "function() {infowindow_"+i+".open(map, marker_"+i+");"
								+ "clickInMap(\""+place+"\") });"
					+ "hashmap.put(\""+place+"\","+key+");";
		}
		result = resultStart+result;
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
