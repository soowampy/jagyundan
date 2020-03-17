package admin.productAdmin.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import admin.productAdmin.model.dao.ProdcutAdminDao;
import petsitter.model.vo.PsInfo;

import static common.JDBCTemplate.*;

import purchase.model.vo.ProductPurchase;
import purchase.model.vo.Purchase;

public class ProdcutAdminService {

	public ArrayList<Purchase> selectList() {
		Connection conn = getConnection();

		ArrayList<Purchase> list = new ProdcutAdminDao().selectList(conn);
		close(conn);
		return list;
	}

	public int adMarketBuyInsertBox(String boxNum, int buyNo) {
		Connection conn = getConnection();
		int result = new ProdcutAdminDao().adMarketBuyInsertBox(conn, boxNum,buyNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
