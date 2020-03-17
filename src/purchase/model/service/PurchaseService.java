package purchase.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.IMG;
import productBoard.model.dao.ProductBoardDao;
import purchase.model.dao.PurchaseDao;
import purchase.model.vo.ProductPurchase;
import purchase.model.vo.Purchase;

public class PurchaseService {
	PurchaseDao pd = new PurchaseDao();

	public int InsertPurchase(Purchase pu) {
		Connection conn = getConnection();
		
		int result = new PurchaseDao().InsertPurchase(conn , pu); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int JjimInsert(int userNo, int productNo) {//찜 목록
		Connection conn = getConnection();
		
		int result = new PurchaseDao().JjimInsert(conn , userNo , productNo); 
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<ProductPurchase> selectList(int userNo) {
		Connection conn = getConnection();
		
		ArrayList<ProductPurchase> list = new PurchaseDao().selectList(conn,userNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<IMG> selectFList() {
		Connection conn = getConnection();

		ArrayList list = null;

		ProductBoardDao pbDao = new ProductBoardDao();

		list = pbDao.selectFList(conn);

		close(conn);

		return list;
	}

	public int RefundInsert(int userNo, int buy_no) {
		Connection conn = getConnection();
		
		int result = new PurchaseDao().RefundInsert(conn,userNo,buy_no);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public ArrayList<ProductPurchase> RefundSelect() {
		Connection conn = getConnection();

		ArrayList list = null;


		list = new PurchaseDao().RefundSelect(conn);

		close(conn);

		return list;
	}

	public int RefundUpdate(String[] buy_no, String status) {
		Connection conn = getConnection();
		
		int result = new PurchaseDao().RefundUpdate(conn,buy_no,status);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

}
