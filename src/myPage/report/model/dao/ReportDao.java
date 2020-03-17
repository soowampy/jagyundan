package myPage.report.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;
import myPage.report.model.vo.Report;

public class ReportDao {
	
	private Properties prop = new Properties();

	public ReportDao() {
		String fileName = Report.class.getResource("/sql/User/report-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Report> selectList(Connection conn,int userNo) {
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReportList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Report(rset.getInt("report_no"), rset.getString("reason"), rset.getInt("singo"),
						rset.getString("title"), rset.getString("wdate"), rset.getString("admin"),
						rset.getString("refer"),rset.getInt("user_no"),rset.getString("reply")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int insertReport(Connection conn, Report n) {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertReport");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getReason());
			pstmt.setInt(2, n.getSingo());
			pstmt.setString(3,n.getTitle());
			pstmt.setString(4, n.getRefer());
			pstmt.setInt(5, n.getUserNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Report selectReport(Connection conn, int reportNo) {
		Report r = null;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReportDetail");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, reportNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				r = new Report(rset.getInt("report_no"), rset.getString("reason"), rset.getInt("singo"),
						rset.getString("title"), rset.getString("wdate"), rset.getString("admin"),
						rset.getString("refer"),rset.getInt("user_no"),rset.getString("reply"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return r;
	}

}
