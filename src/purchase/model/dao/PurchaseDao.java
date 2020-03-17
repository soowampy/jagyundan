package purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.*;



import productBoard.model.dao.ProductBoardDao;
import purchase.model.vo.ProductPurchase;
import purchase.model.vo.Purchase;

public class PurchaseDao {
	private Properties prop = new Properties();
	
	public PurchaseDao() {
		String fileName = ProductBoardDao.class.getResource("/sql/purchase/purchase-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public int InsertPurchase(Connection conn, Purchase pu) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("insertPurchase");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, pu.getUser_no());
			pstmt.setInt(2, pu.getProduct_no());
			pstmt.setString(3, pu.getGet_people());
			pstmt.setString(4, pu.getGet_where());
			pstmt.setString(5, pu.getGet_phone());
			pstmt.setInt(6, pu.getAmount());
			pstmt.setInt(7,pu.getPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int JjimInsert(Connection conn, int userNo, int productNo) {


		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("jjimInsert");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, productNo);
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<ProductPurchase> selectList(Connection conn, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<ProductPurchase> list = null;

		String query = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(query);
			list = new ArrayList<ProductPurchase>();
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ProductPurchase(
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

	public int RefundInsert(Connection conn, int userNo, int buy_no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("RefundInsert");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, buy_no);
			pstmt.setInt(2, userNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList RefundSelect(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<ProductPurchase> list = null;

		String query = prop.getProperty("RefundSelect");

		try {
			pstmt = conn.prepareStatement(query);
			list = new ArrayList<ProductPurchase>();

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ProductPurchase(
						rset.getInt("BUY_NO"), 
						rset.getString("PRODUCT_NAME"),
						rset.getInt("AMOUNT"), 
						rset.getInt("PRICE"),
						rset.getDate("BUY_DATE"),
						rset.getString("BOX_NUM"),
						rset.getString("REFUND"),
						rset.getString("USER_NAME")
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

	public int RefundUpdate(Connection conn, String[] buy_no, String status) {
		PreparedStatement pstmt = null;

		int result = 0;

		String sql = prop.getProperty("RefundUpdate");

				try {
					for(int i=0; i<buy_no.length; i++) {
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, status);
						pstmt.setString(2, buy_no[i]);
						result = pstmt.executeUpdate();

						}
					
				} catch (SQLException e) {
					e.printStackTrace();
				}finally {
					close(pstmt);
				}

		return result;
	}

}
