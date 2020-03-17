package petsitter.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Comment;

import static common.JDBCTemplate.*;
import petsitter.model.vo.Reservation;

public class PsReservInfoDao {
	
	private Properties prop = new Properties();
	
	public PsReservInfoDao(){
		String fileName = PetSitterInfoDao.class.getResource("/sql/petsitter/ps-reservation.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//예약 내역에 정보를 저장하는 부분
	public int insertReserv(Reservation reserv, Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReserv");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, reserv.getPsBoardNum());
			pstmt.setInt(2, reserv.getUserNo());
			pstmt.setInt(3, reserv.getDogSu());
			pstmt.setString(4, reserv.getStartDate());
			pstmt.setString(5, reserv.getEndDate());
			pstmt.setInt(6, reserv.getPrice());
			pstmt.setString(7, reserv.getRequirment());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int deleteReserv(int reservNo, Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<Reservation> selectReservList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public Reservation selectReserv(int reservNO, Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateSchedule(Connection con,String psch,int psNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSchedule");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, psch);
			pstmt.setInt(2, psNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public Reservation checkUserNo(Connection con, int userNo, int psBoardNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Reservation reserv = null;
		String query = prop.getProperty("checkUser");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, psBoardNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				reserv = new Reservation();
				reserv.setPsBoardNum(rset.getInt("ps_board_no"));
				reserv.setUserNo(rset.getInt("user_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return reserv;
	}

	public int insertReply(Connection con, Comment comment) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,comment.getContent());
			pstmt.setInt(2,comment.getUserNo());
			pstmt.setInt(3,comment.getPetsitterNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int updateReply(Connection con, Comment comment, int commentNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1,comment.getContent());
			pstmt.setInt(2,commentNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int insertScore(Connection con, int userNo, int psBoardNo,int score) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertScore");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, score);
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, psBoardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public double getAvgScore(Connection con, int psBoardNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		double avgScore = 0;
		
		String query = prop.getProperty("getAvgScore");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, psBoardNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				avgScore = rset.getInt("AVGSCORE");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return avgScore;
	}

	public int insertScore2(Connection con, int avgScore2,int psNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertScore2");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, avgScore2);
			pstmt.setInt(2, psNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateScore(Connection con, int userNo, int psBoardNo, int score) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateScore");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, score);
			pstmt.setInt(2, psBoardNo);
			pstmt.setInt(3, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
