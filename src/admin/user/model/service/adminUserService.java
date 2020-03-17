package admin.user.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import admin.user.model.dao.adminUserDao;
import user.model.dao.UserDao;
import user.model.vo.User;
public class adminUserService {

	public int adupdateUser(String[] irr,String status) {
	Connection conn = getConnection();
		
		int result = new adminUserDao().adUpdateUser(conn, irr,status);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	//셀렉해온거 담아오기..
	public ArrayList<User> selectList(String[] irr) {
		Connection conn = getConnection();

		ArrayList<User> list = new adminUserDao().selectList(conn,irr);

		close(conn);

		return list;
	}
	



}
