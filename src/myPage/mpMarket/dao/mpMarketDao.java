package myPage.mpMarket.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import productBoard.model.dao.ProductBoardDao;
import purchase.model.vo.ProductPurchase;

public class mpMarketDao {
	private Properties prop = new Properties();
	
	public mpMarketDao() {
		String fileName = ProductBoardDao.class.getResource("/sql/purchase/mp-purchase-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ProductPurchase selectDetail(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ProductPurchase p = null;

		String query = prop.getProperty("selectDetail");

		try {
			pstmt = conn.prepareStatement(query);
			p = new ProductPurchase();
			pstmt.setInt(1, bId);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				p = new ProductPurchase(
						rset.getInt("BUY_NO"), 
						rset.getInt("USER_NO"), 
						rset.getInt("PRODUCT_NO"),
						rset.getString("PRODUCT_NAME"),
						rset.getString("GET_PEOPLE"),
						rset.getString("GET_WHERE"),
						rset.getString("GET_PHONE"),
						rset.getInt("AMOUNT"),
						rset.getInt("PRICE"),
						rset.getDate("BUY_DATE"),
						rset.getString("BOX_NUM"),
						rset.getString("REFUND")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return p;
	}

}
