package myPage.jjim.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import board.model.vo.Board;
import myPage.jjim.model.dao.mpJjimDao;
import myPage.jjim.model.vo.jjim;

public class mpJjimService {
	
	public ArrayList<jjim> selectList(int userNo) {
		Connection conn = getConnection();
		ArrayList<jjim>list = new mpJjimDao().selectJjimList(conn,userNo);
		close(conn);
		return list;
	}

	public int DeleteJjim(String[] irr) {
		Connection conn = getConnection();
		int result = new mpJjimDao().DeleteJjim(conn, irr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
