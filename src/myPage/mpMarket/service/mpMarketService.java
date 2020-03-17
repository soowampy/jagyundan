package myPage.mpMarket.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import myPage.mpMarket.dao.mpMarketDao;
import purchase.model.dao.PurchaseDao;
import purchase.model.vo.ProductPurchase;
public class mpMarketService {
	
	public ProductPurchase selectDetail(int bId) {
		Connection conn = getConnection();
		
		ProductPurchase p = new mpMarketDao().selectDetail(conn,bId);
		
		close(conn);
		
		return p;
	}
}
