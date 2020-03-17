package common.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;

import common.model.dao.IMGDao;
import common.model.vo.IMG;
import user.model.dao.UserDao;
import user.model.vo.User;
public class IMGService {

	//유저사진넣기
	public int insertUserIMG(IMG userimg) {
		Connection conn = getConnection();
		int result = new IMGDao().insertUserImg(conn, userimg);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
}
