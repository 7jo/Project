package com.hanyang.tour.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.hanyang.tour.config.sqlMapConfig;
import com.hanyang.tour.model.NoticeDto;
import com.hanyang.tour.model.ReplyDto;

public class NoticeDao {
	private static NoticeDao noticeDao;

	static {
		noticeDao = new NoticeDao();
	}

	private NoticeDao() {
		
	}

	public static NoticeDao getMemberDao() {
		return noticeDao;
	}

	public List<NoticeDto> list() {

		try {
			return sqlMapConfig.getSqlMapClient().queryForList("view_notice");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public int insert(String contents) {

		try {
			return sqlMapConfig.getSqlMapClient().update("insert_notice", contents);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}
	public int update(NoticeDto nDto) {

		try {
			return sqlMapConfig.getSqlMapClient().update("update_notice", nDto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}
	public int delete(int id) {

		try {
			return sqlMapConfig.getSqlMapClient().update("delete_notice", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}
	public String getContents(int id) {

		try {
			return (String)sqlMapConfig.getSqlMapClient().queryForObject("view_one_notice", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}
