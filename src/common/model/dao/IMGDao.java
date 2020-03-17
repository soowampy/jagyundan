package common.model.dao;
import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import common.model.vo.IMG;
public class IMGDao {
	private Properties prop = new Properties();
	public IMGDao() {
		String fileName = IMGDao.class.getResource("/sql/board/IMG-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//유저사진넣기
	public int insertUserImg(Connection conn, IMG userimg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertUserImg");
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userimg.getOriginName());
				pstmt.setString(2, userimg.getChangeName());
				pstmt.setString(3, userimg.getFilePath());
				pstmt.setInt(4, userimg.getUserNo());

				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
