package notice.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import notice.model.vo.Notice;

import static common.JDBCTemplate.*;






public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
		String fileName = Notice.class.getResource("/sql/notice/notice-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int deleteNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt = null;
		int result=0;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result=pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Notice selectNotice(Connection conn, int noticeNo) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		Notice notice = null;
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("TITLE"),
									rset.getString("CONTENT"),
									rset.getDate("ENROLLDATE"));			
			}
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result=0;
		String sql = prop.getProperty("insertNotice");
		System.out.println(n);
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getContent());
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
		
		
	}

	public ArrayList<Notice> selectList(Connection conn) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		System.out.println(sql);
		try {
			pstmt=conn.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("TITLE"),
									rset.getString("CONTENT"),
									rset.getDate("ENROLLDATE")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int updateNotice(Connection conn, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql=prop.getProperty("updateNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getTitle());
			pstmt.setString(2, n.getContent());
			pstmt.setInt(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		
		}
		
		
		
		return result;
	}

	public ArrayList<Notice> searchList(Connection conn, String search, String sc) {
		ArrayList<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
			try {
				if(sc.equals("title")) {
				String sql = prop.getProperty("titleSearchList");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, search);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("NOTICE_NO"),
										rset.getString("TITLE"),
										rset.getString("CONTENT"),
										rset.getDate("ENROLLDATE")));
				}
				}
				
				
				else if(sc.equals("content")) {
					String sql = prop.getProperty("contentSearchList");
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, search);
					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						list.add(new Notice(rset.getInt("NOTICE_NO"),
								rset.getString("TITLE"),
								rset.getString("CONTENT"),
								rset.getDate("ENROLLDATE")));
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
}


