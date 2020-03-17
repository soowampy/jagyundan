package user.model.dao;
import static common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import common.model.vo.IMG;
import user.model.vo.User;
public class UserDao {
	// sql 폴더 안에 User 폴더 만들고 User-query.properties 파일 만들기
	private Properties prop = new Properties();

	public UserDao() {
		// 항상 memeber-query.properties에서 값을 가져올 수 있도록
		// 기본 생성자 안에서 properties 파일을 불러오는 작업을 하자~~
		String fileName = UserDao.class.getResource("/sql/User/User-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 1. 회원 로그인용 dao
	public User loginUser(Connection conn, String id, String pwd) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser");
//loginUser=SELECT * FROM User WHERE USERID=? AND USERPWD=? AND ADMIN='Y'
		System.out.println(id);
		System.out.println(pwd);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin"));
			}System.out.println(loginUser);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
	
	
	//사진첨부용 로그인유저..
	public User loginUser2(Connection conn, String id, String pwd) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser2");
//loginUser=SELECT * FROM User WHERE USERID=? AND USERPWD=? AND ADMIN='Y'
		System.out.println(id);
		System.out.println(pwd);
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("change_name"),rset.getString("file_path"),rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin"));
			}System.out.println(loginUser);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
		
	
	//소셜로그인용
	public User loginUser3(Connection conn, String id) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginUser3");
//loginUser=SELECT * FROM User WHERE USERID=? AND USERPWD=? AND ADMIN='Y'
System.out.println(sql+"ㅇㅇ???");
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("change_name"),rset.getString("file_path"),rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin"));
			}System.out.println(loginUser+"왔냐..");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}
	

	// 2. 회원 가입용 dao
	public int insertUser(Connection conn, User m) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertUser");
		System.out.println(sql);
		System.out.println(m);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());
			pstmt.setInt(7, m.getdogSu());
			pstmt.setString(8, m.getPhone());
			pstmt.setString(9, m.getBirth());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	// 3. 아이디 중복 확인용 dao
	public int idCheck(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// 4. 회원 수정용 dao
	public int updateUser(Connection conn, User m) {
		int result = 0;
//updateUser=UPDATE MEMBER SET ADDRESS=?, dogSu=?, PHONE=? WHERE USER_ID=?

		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateUser");
		System.out.println(sql);
		System.out.println("ㅋㅋ"+m);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getAddress());
			pstmt.setString(2, m.getPhone());
			pstmt.setInt(3, m.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 5. 회원 조회용 dao, 이미지용 아이디 셀렉 // 업데이트유저, 비밀번호변경,개수업뎃
	public User selectUser(Connection conn, String userId) {
		User mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(userId+1);
		String sql = prop.getProperty("selectUser");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				mem = new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("change_name"),rset.getString("file_path"),
						rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_Su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin"));
			}
			System.out.println(mem);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}
	
	
	
	//5.회원가입용 첫번째 셀렉유저
	public User selectUser2(Connection conn, String userId) {
		User mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println(userId+1);
		String sql = prop.getProperty("selectUser2");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				mem = new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),
						rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_Su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin"));
			}
			System.out.println(mem);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mem;
	}

	// 6. 비밀번호 변경용 dao
	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}
	
	// 7. 회원 탈퇴용 dao
	public int deleteUser(Connection conn, String userPwd) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("deleteUser");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//관리자용 리스트 뽑기
	public ArrayList<User> selectList(Connection conn) {
		ArrayList<User> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectUserList");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new User(rset.getInt("user_no"), rset.getString("user_id"), rset.getString("user_pwd"),
						rset.getString("user_name"), rset.getString("gender"),rset.getString("email"),
						rset.getString("address"),rset.getInt("dog_Su"),rset.getString("phone"),
						rset.getString("birth"),rset.getString("admin")));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//이메일 체크용
	public int emailCheck(Connection conn, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("emailCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	//유저사진넣기
	public int insertUserImg(Connection conn, IMG userimg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertUserImg");
		System.out.println(sql);
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userimg.getOriginName());
				pstmt.setString(2, userimg.getChangeName());
				pstmt.setString(3, userimg.getFilePath());
				pstmt.setInt(4, userimg.getUserNo());

				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int UpdateUserImg(Connection conn, IMG userimg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateUserImg");
		System.out.println(sql);
		try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userimg.getOriginName());
				pstmt.setString(2, userimg.getChangeName());
				pstmt.setString(3, userimg.getFilePath());
				pstmt.setInt(4, userimg.getUserNo());

				result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	
	//소셜회원가입용
	public int naverInsertUser(Connection conn, String naverId, String address, String phone, String birth,int dogCount) {
		int result = 0;
//updateUser=UPDATE MEMBER SET ADDRESS=?, dogSu=?, PHONE=? WHERE USER_ID=?

		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("naverInsertUser");
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,address);
			pstmt.setString(2,phone);
			pstmt.setInt(3,dogCount);
			pstmt.setString(4,birth);
			pstmt.setString(5, naverId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
}
