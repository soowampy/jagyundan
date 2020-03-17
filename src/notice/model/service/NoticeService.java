 package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
public class NoticeService {

	public int deleteNotice(int noticeNo) {
		
		Connection conn = getConnection();
		System.out.println("deleteNotice Service");
		int result = new NoticeDao().deleteNotice(conn,noticeNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice notice = new NoticeDao().selectNotice(conn,noticeNo);
		close(conn);
		
		return notice;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(conn);
		close(conn);
		return list;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDao().updateNotice(conn,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Notice> searchNotice(String search, String sc) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDao().searchList(conn,search,sc);
		close(conn);
		return list;
	}

}
