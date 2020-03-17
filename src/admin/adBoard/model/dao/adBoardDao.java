package admin.adBoard.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import static common.JDBCTemplate.*;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import common.model.vo.IMG;

public class adBoardDao {
	private Properties prop = new Properties();
	
	
	public adBoardDao() {
		String fileName = BoardDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//게시판 리스트뽑아오기..
	public ArrayList<Board> selectList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						rset.getString(6),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(8),
						rset.getInt(3),
						rset.getString(9),
						rset.getInt(7)));
		}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int deleteBoard(Connection conn, String[] irr, String status) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("adDeleteBoard");
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
	
	//이미지
	public ArrayList<Board> selectIMGList(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdIMGBoardList1");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt(2),
						rset.getString(6),
						rset.getString(4),
						rset.getString(5),
						rset.getDate(8),
						rset.getInt(3),
						rset.getString(9),
						rset.getInt(7)));
		}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> selectIMG(Connection conn) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdIMGBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while(rset.next()) {
				list.add(new Board(rset.getInt("board_no"),
						rset.getInt("cate"),
						rset.getString("title"),
						rset.getString("content"),
						rset.getString("change_name"),
						rset.getString("file_path"),
						rset.getString("user_Id"),
						rset.getInt("board_count"),
						rset.getDate("eroll_date"),
						rset.getString("status")));
		}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

}
