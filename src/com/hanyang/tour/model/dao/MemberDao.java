package com.hanyang.tour.model.dao;

import java.sql.SQLException;

import com.hanyang.tour.config.sqlMapConfig;
import com.hanyang.tour.model.MemberDto;

public class MemberDao {

	private static MemberDao memberDao;
	
	static {
		memberDao = new MemberDao();
	}
	
	private MemberDao(){
		
	}
	
	public static MemberDao getMemberDao(){
		return memberDao;
	}
	
	public int signup(MemberDto memberDao) {

		try {
			return sqlMapConfig.getSqlMapClient().update("sign_up", memberDao);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}
}
