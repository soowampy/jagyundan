package myPage.mpBoard.service;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Properties;

import admin.adBoard.model.dao.adBoardDao;

import static common.JDBCTemplate.*;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import myPage.mpBoard.dao.mpBoardDao;

public class mpBoardService {
	private Properties prop = new Properties();
	
	


	public ArrayList<Board> selectList(String userNo) {
		Connection conn = getConnection();
		ArrayList<Board>list = new mpBoardDao().selectList(conn,userNo);
		close(conn);
		return list;
	}

}
