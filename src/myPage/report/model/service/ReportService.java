package myPage.report.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import myPage.report.model.dao.ReportDao;
import myPage.report.model.vo.Report;

public class ReportService {
	

	//1.신고내역 리스트 조회용
	public ArrayList<Report> selectList(int userNo) {
		Connection conn = getConnection();

		ArrayList<Report> list = new ReportDao().selectList(conn,userNo);

		close(conn);

		return list;
	}

	public int InsertReport(Report n) {
		Connection conn = getConnection();
		int result = new ReportDao().insertReport(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public Report selectReportDetail(int reportNo) {
		Connection conn = getConnection();
		Report r=null;
		r = new ReportDao().selectReport(conn, reportNo);
		commit(conn);
		
		close(conn);

		return r;
	}



}
