package admin.Petsitter.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import admin.user.model.dao.adminUserDao;
import petsitter.model.vo.PsInfo;
import user.model.dao.UserDao;
import user.model.vo.User;

public class AdminPetsitterService {
	public ArrayList<PsInfo> selectList() {
		Connection conn = getConnection();

		ArrayList<PsInfo> list = new AdminPetsitterDao().selectList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<PsInfo> selectRequestList() {
		Connection conn = getConnection();

		ArrayList<PsInfo> list = new AdminPetsitterDao().selectRequestList(conn);
		close(conn);
		return list;
	}

	public int adUpdatePetsitterRequest(String[] irr, String status) {
	Connection conn = getConnection();
		int result = new AdminPetsitterDao().adUpdatePetsitterRequest(conn, irr,status);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int adPetsitterSchedule(String[] irr) {
		return 0;
	}

	public int adUpdatePetsitterFire(String[] irr) {
		Connection conn = getConnection();
		int result = new AdminPetsitterDao().adUpdatePetsitterFire(conn, irr);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
