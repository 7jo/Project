package com.hanyang.tour.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.hanyang.tour.config.sqlMapConfig;
import com.hanyang.tour.model.ReplyDto;

public class ReplyDao {
private static ReplyDao replyDao;
	static {
		replyDao = new ReplyDao();
	}
	
	private ReplyDao() {}

	public static ReplyDao getMemberDao() {
		return replyDao;
	}
	
public int update(ReplyDto dto) {
		
		try {
			return sqlMapConfig.getSqlMapClient().update("update_commemt",dto); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public List<ReplyDto> list(String place) {
		
		try {
			return sqlMapConfig.getSqlMapClient().queryForList("view_commemt",place);
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return null;
	}


}
