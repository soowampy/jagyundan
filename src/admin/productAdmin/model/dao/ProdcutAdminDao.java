package admin.productAdmin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petsitter.model.vo.PsInfo;
import purchase.model.vo.ProductPurchase;
import purchase.model.vo.Purchase;
import user.model.dao.UserDao;

public class ProdcutAdminDao {
	private Properties prop = new Properties();
	public ProdcutAdminDao() {
		// 항상 memeber-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자~~
		String fileName = UserDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Purchase> selectList(Connection conn) {
		ArrayList<Purchase> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectPurchaseList");
		//select m.user_id,m.user_name,pi.* from ps_info pi, member m where pi.user_no=m.user_no and approval='y';
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new Purchase(
						rset.getInt("BUY_NO"), 
						rset.getInt("USER_NO"), 
						rset.getInt("PRODUCT_NO"),
						rset.getString("GET_PEOPLE"),
						rset.getString("GET_WHERE"),
						rset.getString("GET_PHONE"),
						rset.getInt("AMOUNT"),
						rset.getInt("PRICE"),
						rset.getDate("BUY_DATE"),
						rset.getString("BOX_NUM"),
						rset.getString("REFUND")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int adMarketBuyInsertBox(Connection conn, String boxNum, int buyNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adMarketBuyInsertBox");

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boxNum);
			pstmt.setInt(2, buyNo);

			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
