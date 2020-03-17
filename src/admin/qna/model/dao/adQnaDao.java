package admin.qna.model.dao;
import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import myPage.report.model.vo.Report;
import petsitter.model.vo.PsInfo;
import user.model.dao.UserDao;
public class adQnaDao {
	private Properties prop = new Properties();
	public adQnaDao() {
		// 항상 memeber-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자~~
		String fileName = UserDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<Report> selectList(Connection conn) {
		ArrayList<Report> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectQnaList");
		//select m.user_id,m.user_name,pi.* from ps_info pi, member m where pi.user_no=m.user_no and approval='y';
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Report(rset.getInt("report_no"), rset.getString("reason"), rset.getInt("singo"),
						rset.getString("title"), rset.getString("wdate"), rset.getString("admin"),
						rset.getString("refer"),rset.getInt("user_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
}


	public int adQnaReply(Connection conn, int reportNo, String reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("QnaReply");
		System.out.println(query);
		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reply);
			pstmt.setInt(2, reportNo);

			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	}
