package admin.user.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import user.model.vo.User;

import static common.JDBCTemplate.*;

public class adminUserDao {
	private Properties prop = new Properties();

	public adminUserDao() {
		// 항상 memeber-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자~~
		String fileName = adminUserDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int adUpdateUser(Connection conn, String[] irr,String status) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("adupdateUser");
		

		
		try {
			for(int i=0; i<irr.length; i++) {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setString(2, irr[i]);
			result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<User> selectList(Connection conn,String[] irr) {
		ArrayList<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("emailUserList");
		
		
		try {
			for(int i=0; i<irr.length; i++) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, irr[i]);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_Su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin")));}
			}

			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return list;
	}

}
