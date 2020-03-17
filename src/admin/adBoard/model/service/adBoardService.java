package admin.adBoard.model.service;


import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import admin.adBoard.model.dao.adBoardDao;
import board.model.dao.BoardDao;
import board.model.vo.Board;
import common.model.vo.IMG;

public class adBoardService {

	//보드리스트뽑아오긔
	public ArrayList<Board> selectList() {
		Connection conn = getConnection();
		ArrayList<Board>list = new adBoardDao().selectList(conn);
		close(conn);
		return list;
	}

	public int deleteBoard(String[] irr, String status) {
		Connection conn = getConnection();
		int result = new adBoardDao().deleteBoard(conn, irr,status);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	//이미지
	public ArrayList<Board> selectIMGList() {
		Connection conn = getConnection();
		ArrayList<Board>list = new adBoardDao().selectIMGList(conn);
		close(conn);
		return list;
	}
	
	public ArrayList<Board> selectIMG() {
		Connection conn = getConnection();
		ArrayList<Board> list = new adBoardDao().selectIMG(conn);
		close(conn);
		return list;
		
	}

}
