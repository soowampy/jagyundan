package petsitter.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.model.vo.IMG;

import static common.JDBCTemplate.*;

import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;
import user.model.vo.User;

public class PetSitterInfoDao {
	private Properties prop = new Properties();
	public PetSitterInfoDao(){
		String fileName = PetSitterInfoDao.class.getResource("/sql/petsitter/petsitter-query.properties").getPath();
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
	//펫시터 지원 데이터를 DB에 저장하는 부분
	public int insertPs(PsInfo ps, Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(ps);
		String query = prop.getProperty("insertPs");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, ps.getUserNo());
			pstmt.setString(2, ps.getReason());
			pstmt.setString(3, ps.getJob());
			pstmt.setString(4, ps.getDogChk());
			pstmt.setString(5, ps.getCareExp());
			pstmt.setString(6, ps.getCertific());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deletePs(int psNo, Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updatePsInfo(PsInfo psInfo, int psNo, Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<PsInfo> selectList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public PsInfo selectDetail(int psNo,Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//USER_NO Member 테이블에서 가져오는 부분 
	public int getUserNo(Connection con, String userId) {
		// TODO Auto-generated method stub
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("getUserNo");
		User user = new User();
		int userNo = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				userNo = rset.getInt("user_no");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return userNo;
	}
	//PS_INFO에 해당 userNo로 되어 있는 펫시터 지원양식을 가져오는 부분
	public PsInfo checkUser(Connection con, int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PsInfo ps = null;
		String query = prop.getProperty("checkUser");
		System.out.println("petsitterDao : checkUser");
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ps = new PsInfo();
				ps.setPsNo(rset.getInt("petsitter_no"));
				ps.setUserNo(rset.getInt("user_no"));
				ps.setApproval(rset.getString("approval"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ps;
	}

}
