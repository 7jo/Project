package com.hanyang.tour.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.hanyang.tour.config.sqlMapConfig;
import com.hanyang.tour.model.Place2Dto;
import com.hanyang.tour.model.PlaceDto;

public class Place2Dao {
	private static Place2Dao place2Dao;

	static {
		place2Dao = new Place2Dao();
	}

	private Place2Dao() {
		
	}

	public static Place2Dao getMemberDao() {
		return place2Dao;
	}

	public List<Place2Dto> list() {

		try {
			return  sqlMapConfig.getSqlMapClient().queryForList("place2");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	public String getPath(String place){
		try {
			return  (String)sqlMapConfig.getSqlMapClient().queryForObject("view_path",place);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	public Place2Dto getPdto(String place) {

		try {
			return (Place2Dto) sqlMapConfig.getSqlMapClient().queryForObject("view_pid", place);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}
