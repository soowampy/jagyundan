package admin.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import admin.productAdmin.model.dao.ProdcutAdminDao;
import admin.qna.model.dao.adQnaDao;

import static common.JDBCTemplate.*;
import myPage.report.model.vo.Report;
import petsitter.model.vo.PsInfo;

public class adQnaService {

	public ArrayList<Report> selectList() {
		Connection conn = getConnection();

		ArrayList<Report> list = new adQnaDao().selectList(conn);
		close(conn);
		System.out.println("z"+list);
		return list;
	}

	public int adQnaReply(int reportNo, String reply) {
		Connection conn = getConnection();
		int result = new adQnaDao().adQnaReply(conn, reportNo,reply);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
