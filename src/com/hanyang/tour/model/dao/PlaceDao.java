package com.hanyang.tour.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.hanyang.tour.config.sqlMapConfig;
import com.hanyang.tour.model.PlaceDto;
import com.hanyang.tour.model.ReplyDto;

public class PlaceDao {
	private static PlaceDao placeDao;

	static {
		placeDao = new PlaceDao();
	}

	private PlaceDao() {
		
	}

	public static PlaceDao getMemberDao() {
		return placeDao;
	}

	public PlaceDto getPdto(String place) {

		try {
			return (PlaceDto) sqlMapConfig.getSqlMapClient().queryForObject("view_pid", place);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
