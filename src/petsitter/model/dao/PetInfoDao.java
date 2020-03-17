package petsitter.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import petsitter.model.vo.Pet;
import user.model.dao.UserDao;
import user.model.vo.User;

public class PetInfoDao {
	private Properties prop = new Properties();

	public PetInfoDao() {
		// 항상 memeber-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자~~
		String fileName = UserDao.class.getResource("/sql/petsitter/petInfo-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//개 지우기
	public int deletePet(Connection con, int dogNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deletePet");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dogNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//개 지우기(dogNum-1)
	public int updateDogSu2(Connection conn, User u) {
		int result = 0;

		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDogSu2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u.getUserNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	
	
	
	
	//개 추가용
	public int insertPet(Connection con, Pet p) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPet");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, p.getDogName());
			pstmt.setString(2, p.getGender());
			pstmt.setString(3, p.getSize());
			pstmt.setString(4, p.getNeutralize());
			pstmt.setString(5, p.getVaccination());
			pstmt.setInt(6, p.getAge());
			pstmt.setString(7, p.getToiletTrain());
			pstmt.setInt(8, p.getUserNo());
						
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatePet(Connection con, Pet pet, int dogNum) {

		return 0;
	}


	//유저넘버로 펫정보가져오기
	public Pet selectPet(Connection con, int userNo) {
		Pet pet = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectPet");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				pet = new Pet(rset.getInt("dog_num"), rset.getString("dog_name"), rset.getString("gender"),
						rset.getString("size"),rset.getString("neutralize"),rset.getString("vaccination"),
						rset.getInt("age"),rset.getString("toilet_train"),
						rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pet;
	}
	
	//펫넘버로 펫정보가져오기
	public Pet selectPetNo(Connection con, int dogNo) {
		Pet pet = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPetNo");

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, dogNo);
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				pet = new Pet(rset.getInt("dog_num"), rset.getString("dog_name"), rset.getString("gender"),
						rset.getString("size"),rset.getString("neutralize"),rset.getString("vaccination"),
						rset.getInt("age"),rset.getString("toilet_train"),
						rset.getInt("user_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pet;
	}
	
	
	
	//개 수 업뎃용
	public int updateDogSu(Connection conn, User u) {
		int result = 0;

		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateDogSu");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, u.getUserNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//리스트 갖고오기
	public ArrayList<Pet> selectList(Connection conn,int userNo) {
		ArrayList<Pet> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectPetList");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new Pet(rset.getInt("dog_num"), rset.getString("dog_name"), rset.getString("gender"),
						rset.getString("size"),rset.getString("neutralize"),rset.getString("vaccination"),
						rset.getInt("age"),rset.getString("toilet_train"),
						rset.getInt("user_no")));
			}
			
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//펫번호로 펫정보 갖고오기
	public Pet selectPet2(Connection con, int dogNum) {
		// TODO Auto-generated method stub
		return null;
	}
}
