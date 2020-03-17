package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Date;

import board.model.vo.Board;
import board.model.vo.Comment;
import common.model.vo.IMG;


public class BoardDao {
	private Properties prop = new Properties();
	
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	public int deleteBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result =0;
		String sql = prop.getProperty("deleteBoard");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result=pstmt.executeUpdate();			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}

	public Board selectBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
		
		String sql = prop.getProperty("selectBoard");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(rset.getInt("BOARD_NO"),
						rset.getString("USER_NAME"),
						rset.getString("TITLE"),
						rset.getString("CONTENT"),
						// 오타 ENROLL_DATE
						rset.getDate("EROLL_DATE"),
						rset.getInt("CATE"),
						rset.getString("STATUS"),
						rset.getInt("BOARD_COUNT"));
			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return board;
		
	}

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("insertBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getUserName()));
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	}

	
	
	
	
	
	
	
	
	
	public int getListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	
	public ArrayList<Board> selectList(Connection conn, int currentPage, int boardLimit) {
		ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage-1)* boardLimit +1;
			int endRow = startRow + boardLimit -1;
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
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
	
	
	public void updateForm() {
		
		
	}

	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql=prop.getProperty("updateBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, b.getTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getBoardNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		
		
		return result;
		
	}

	public int IMGDelete(Connection conn, int bId) {
		int result=0;
		return result;
	}

	public ArrayList<IMG> selectIMG(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		ArrayList<IMG>list = null;
		
		String sql = prop.getProperty("selectIMG");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset=pstmt.executeQuery();
			
			list=new ArrayList<IMG>();
			
			while(rset.next()) {
				IMG image = new IMG();
				image.setBoardNo(rset.getInt("BOARD_NO"));
				image.setOriginName(rset.getString("ORIGIN_NAME"));
				image.setChangeName(rset.getString("CHANGE_NAME"));
				image.setFilePath(rset.getString("FILE_PATH"));
				image.setUploadDate(rset.getDate("UPLOAD_DATE"));
				image.setCategory(rset.getInt("CATE"));
				
				list.add(image);
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
	}

	public int insertIMG(Connection conn, ArrayList<IMG> fileList) {
		PreparedStatement pstmt=null;
				
		int result = 0;
		String sql=prop.getProperty("insertIMG");
		
		try {
			for(int i=0;i<fileList.size(); i++) {
				IMG image = fileList.get(i);
			
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,image.getOriginName());
				pstmt.setString(2, image.getChangeName());
				pstmt.setString(3, image.getFilePath());
				pstmt.setInt(4, image.getFileLevel());
				
				result += pstmt.executeUpdate();
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}




	

	public int insertComment(Connection conn, Comment cm) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cm.getContent());
			pstmt.setInt(2, cm.getBoardNo());
			pstmt.setInt(3, cm.getUserNo());
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Comment> selectCommentList(Connection conn, int boardNo) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
				
		ArrayList<Comment> clist = null;
		
		String sql =prop.getProperty("selectCommentList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset=pstmt.executeQuery();
			
			clist=new ArrayList<Comment>();
			
			while(rset.next()) {
				clist.add(new Comment(rset.getInt("COMMENT_NO"),
									rset.getString("CONTENT"),
									rset.getInt("BOARD_NO"),
									rset.getString("USER_NAME"),
									rset.getString("STATUS"),
									rset.getDate("ENROLL_DATE"),
									rset.getString("CHANGE_NAME")));
			}	
		
			
			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
		
	}

	public int insertIMGBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt=null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("insertIMGBoard");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b.getUserName()));
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
		
			result=pstmt.executeUpdate();
			
		
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	

	



	public int increasCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}




	public ArrayList<Board> searchList(Connection conn, String search, String sc) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
			try {
				if(sc.equals("title")) {
				String sql = prop.getProperty("titleSearchList");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
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
				}
				
				
				else if(sc.equals("content")) {
					String sql = prop.getProperty("contentSearchList");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
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
				
								
			}else if(sc.equals("writer")) {
				String sql = prop.getProperty("writerSearchList");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
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
				
			}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}		
		
		
		return list;
	}

	
public ArrayList<Board> IMGsearchList(Connection conn, String search, String sc) {
		
		ArrayList<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
			try {
				if(sc.equals("title")) {
				String sql = prop.getProperty("IMGtitleSearchList");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
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
				}
				
				
				else if(sc.equals("content")) {
					String sql = prop.getProperty("IMGcontentSearchList");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
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
				
								
			}else if(sc.equals("writer")) {
				String sql = prop.getProperty("IMGwriterSearchList");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
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
				
			}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}		
		
		
		return list;
	}



	public int deleteComment(Connection conn, int commentNo) {
		
		PreparedStatement pstmt = null;
		int result =0;
		String sql = prop.getProperty("deleteComment");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			result=pstmt.executeUpdate();			
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
		
	}



/*이미지 게시판*/
	public int getIMGListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getIMGListCount");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
		
	}

	public ArrayList<Board> selectBList(Connection conn, int currentPage, int boardLimit) {
ArrayList<Board> list = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectBList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (currentPage-1)* boardLimit +1;
			int endRow = startRow + boardLimit -1;
		
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
		
			
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
	
	public ArrayList selectFList(Connection conn) {
		ArrayList<IMG> list = new ArrayList<IMG>();
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectFList");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				IMG image=new IMG();
				image.setBoardNo(rset.getInt("BOARD_NO"));
				image.setChangeName(rset.getString("CHANGE_NAME"));
				image.setFileLevel(rset.getInt("FILE_LEVEL"));
				
				
				
				list.add(image);
				
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}




	public Board selectIMGBoard(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board board = null;
		
		String sql = prop.getProperty("selectIMGBoard");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Board(rset.getInt("BOARD_NO"),
						rset.getString("USER_NAME"),
						rset.getString("TITLE"),
						rset.getString("CONTENT"),
						// 오타 ENROLL_DATE
						rset.getDate("EROLL_DATE"),
						rset.getInt("CATE"),
						rset.getString("STATUS"),
						rset.getInt("BOARD_COUNT"));
			
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return board;
	}



/*사진수정*/
	public int updateIMG(Connection conn, ArrayList<IMG> fileList, Board b) {
		PreparedStatement pstmt=null;
		
		int result = 0;
		String sql=prop.getProperty("updateIMG");
		
		try {
			for(int i=0;i<fileList.size(); i++) {
				IMG image = fileList.get(i);
			
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,image.getOriginName());
				pstmt.setString(2, image.getChangeName());
				pstmt.setString(3, image.getFilePath());
				pstmt.setInt(4, image.getFileLevel());
				pstmt.setInt(5, b.getBoardNo());
				pstmt.setInt(6, i);
				result += pstmt.executeUpdate();
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}







}
