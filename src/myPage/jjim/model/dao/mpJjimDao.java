package myPage.jjim.model.dao;
import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Board;
import myPage.jjim.model.vo.jjim;
import productBoard.model.dao.ProductBoardDao;
public class mpJjimDao {
	private Properties prop = new Properties();
	
	public mpJjimDao() {
		String fileName = ProductBoardDao.class.getResource("/sql/purchase/mp-purchase-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<jjim> selectJjimList(Connection conn, int userNo) {
		ArrayList<jjim> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectJJIM");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new jjim(rset.getInt("JJIM_NO"),
						rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_NAME"),
						rset.getInt("PRICE"),
						rset.getInt("USER_NO")));
				System.out.println(list);
		}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int DeleteJjim(Connection conn, String[] irr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("DeleteJjim");
		System.out.println(query);
		try {

			
			for(int i=0; i<irr.length; i++) {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, irr[i]);

			result = pstmt.executeUpdate();

			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
