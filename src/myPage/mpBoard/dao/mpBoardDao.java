package myPage.mpBoard.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import board.model.dao.BoardDao;
import board.model.vo.Board;

public class mpBoardDao {
	private Properties prop = new Properties();
	
	
	public mpBoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/mp-board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectList(Connection conn, String userId) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
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

}
