package petsitter.model.dao;

import static common.JDBCTemplate.close;

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

import javax.sound.midi.Synthesizer;

import board.model.vo.Comment;
import common.model.vo.IMG;
import petsitter.model.vo.PsBList;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfoDetail;
import petsitter.model.vo.PsSchedule;

public class PsBoardInfoDao {
	
	private Properties prop = new Properties();

	public PsBoardInfoDao() {
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
	
	public int deleteBoard(int psBoardNo, Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBoard(PsBoard psBoard, int psBoardNo, Connection con) {
		// TODO Auto-generated method stub
		return 0;
	}

	public ArrayList<PsBoard> selectList(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//모든 ps_board 정보를 가져오는 부분
	public PsBoard selectDetail(int psBoardNo, Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPsBoard");
		
		PsBoard psb = null;
		System.out.println("dao");
		System.out.println("****selectDetail****");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, psBoardNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				psb = new PsBoard(rset.getInt("ps_board_no"),rset.getDate("enroll_date"),rset.getInt("hour_price"),
						rset.getString("service"),rset.getString("care_size"),rset.getString("care_age"),
						rset.getInt("petsitter_no"),rset.getString("check_in"),rset.getString("check_out"),
						rset.getInt("oneday_price"),rset.getString("title"),rset.getString("content"),
						rset.getString("status"));
				System.out.println(psb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return psb;
	}

	//ps_board 게시물 내용을 저장하는 부분 
	public int insertPsBoard(PsBoard pb,Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("insertPsBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,pb.getHourPrice()); //hourPrice
			pstmt.setString(2,pb.getService());//service
			pstmt.setString(3,pb.getCareSize());//size
			pstmt.setString(4, pb.getCareAge());//age
			pstmt.setInt(5,pb.getPsNo());//psNo
			pstmt.setString(6,pb.getCheckIn()); //checkIn
			pstmt.setString(7, pb.getCheckOut()); //checkOut
			pstmt.setInt(8,pb.getOneDayPrice());
			pstmt.setString(9,pb.getTitle());
			pstmt.setString(10, pb.getContent());
			System.out.println("psboard 저장중");
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//IMG테이블에 바뀐 사진이름이랑 이런것들 저장하는 부분
	public int insertImg(ArrayList<IMG> fileList,Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("insertImg");
		
		try {
			for(int i = 0;i<fileList.size();i++) {
				IMG img = fileList.get(i);
				System.out.println(img);
				System.out.println("IMG 저장중");
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2, img.getChangeName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getCategory());
				pstmt.setInt(5, img.getFileLevel());
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//펫시터 게시글을 썻는지 안썻는지 확인 하는 부분
	public PsBoard checkBoard(Connection con, int psNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("PsBoardInfoDao : checkBoard");
		System.out.println("petsitter_no : "+psNo);
		String sql = prop.getProperty("checkBoard");
		PsBoard pb = null;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, psNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pb = new PsBoard();
				pb.setPsNo(rset.getInt("petsitter_no"));
				pb.setPsBoardNo(rset.getInt("ps_board_no"));
			}
			System.out.println(pb);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pb;
	}

	//간단하게 만든 psbList view를 출력 하는 부분
	public ArrayList selectBList(Connection con) {
		// TODO Auto-generated method stub
		System.out.println("PsBoardInfoDao : selectBList(게시글)");
		Statement stmt = null; 
		ResultSet rset = null;
		ArrayList<PsBList> list = new ArrayList<>(); //얘는 bList를 뽑아 오기 위해서 사용하는 부분
		
		String sql = prop.getProperty("selectBList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				PsBList psb = new PsBList(rset.getInt("rnum"),rset.getInt("ps_board_no"),
						rset.getString("title"),rset.getInt("hour_price"),rset.getInt("oneday_price"),
						rset.getString("user_name"),rset.getInt("dog_su"),rset.getInt("score"),rset.getInt("user_no"));
				System.out.println(psb);
				list.add(psb);
				System.out.println("success : add psb to list");
			}
			for(PsBList psb : list) {
				System.out.println(psb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	//펫시터 글들의 사진들을 모조리 가져오는 부분
	public ArrayList selectIList(Connection con) {
		// TODO Auto-generated method stub
		System.out.println("PsBoardInfoDao : selectIList(이미지)");
		Statement stmt = null; 
		ResultSet rset = null;
		
		ArrayList<IMG> list = new ArrayList<>(); //IMG리스트를 받아오기 위해서
		
		String sql = prop.getProperty("selectIList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				IMG img = new IMG();
				img.setBoardNo(rset.getInt("board_no"));
				img.setChangeName(rset.getString("change_name"));
				System.out.println(img);
				list.add(img);
			}
			for(IMG img : list) {
				System.out.println(img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	
	//해당 펫시터 게시글을 쓴 사람들의 프로필 사진을 가져오는 부분
	public ArrayList selectPList(Connection con) {
		// TODO Auto-generated method stub
		System.out.println("PsBoardInfoDao : selectPList(프로필 이미지)");
		Statement stmt = null; 
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPList");
		
		ArrayList<IMG> list = new ArrayList<>(); 
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				IMG img = new IMG();
				img.setBoardNo(rset.getInt("board_no"));
				img.setUserNo(rset.getInt("user_no"));
				img.setChangeName(rset.getString("change_name"));
				
				list.add(img);
			}
			for(IMG img : list) {
				System.out.println(img);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}

	//해당 펫시터의 개인정보를 가져오는 부분
	public PsInfoDetail selectPsInfoDetail(Connection con, int psNo) {
		// TODO Auto-generated method stub
		System.out.println("dao");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PsInfoDetail pid = null;
		
		String query = prop.getProperty("selectPsInfoDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, psNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pid = new PsInfoDetail(rset.getInt("user_no"),rset.getString("user_name"),
						rset.getString("address"),rset.getString("email"),rset.getString("phone"),
						rset.getInt("petsitter_no"),rset.getInt("score"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return pid;
	}

	
	//선택된 해당 펫시터 글 사진을 불러오는 부분
	public ArrayList<IMG> selectBoardImg(Connection con, int psBoardNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("dao : selectBoardImg");
		ArrayList<IMG> list = new ArrayList<>(); 
		
		String query = prop.getProperty("selectBoardImg");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, psBoardNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				IMG img = new IMG();
				img.setBoardNo(rset.getInt("board_no"));
				img.setChangeName(rset.getString("change_name"));
				list.add(img);
			}
			System.out.println(list.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public IMG selectPsImage(Connection con,int userNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		IMG img = null;
		
		String query = prop.getProperty("selectPsImage");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				img = new IMG();
				
				img.setChangeName(rset.getString("change_name"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return img;
	}

	public PsSchedule selectPsSchedule(Connection con, int psNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPsSchedule");
		PsSchedule psch = null;
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1,psNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				psch = new PsSchedule();
				psch.setApDate(rset.getString("ap_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return psch;
	}
	//간단하게 만든 psbList view를 출력 하는 부분

	public ArrayList<Comment> selectCommentList(Connection conn, int psBoardNo) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
				
		ArrayList<Comment> clist = new ArrayList<Comment>();
		
		String sql =prop.getProperty("selectCommentList");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, psBoardNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				Comment com = new Comment();
				com.setCommentNo(rset.getInt("comment_no"));
				com.setContent(rset.getString("content"));
				com.setUserName(rset.getString("user_name"));
				com.setEnrollDate(rset.getDate("enroll_date"));
				com.setChangeName(rset.getString("change_name"));
				com.setPetsitterNo(rset.getInt("ps_board_no"));
				clist.add(com);
			}	
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public Comment checkComment(Connection con, int loginUserNo, int psBoardNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Comment com = null;
		
		String query = prop.getProperty("checkComment");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, psBoardNo);
			pstmt.setInt(2, loginUserNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				com = new Comment();
				com.setCommentNo(rset.getInt("comment_no"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return com;
	}

	public int deleteReply(Connection con, int commentNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, commentNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updatePsBoard(PsBoard pb, int psBoardNo, Connection con) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String sql = prop.getProperty("updatePsBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,pb.getHourPrice()); //hourPrice
			pstmt.setString(2,pb.getService());//service
			pstmt.setString(3,pb.getCareSize());//size
			pstmt.setString(4, pb.getCareAge());//age
			pstmt.setInt(5,pb.getPsNo());//psNo
			pstmt.setString(6,pb.getCheckIn()); //checkIn
			pstmt.setString(7, pb.getCheckOut()); //checkOut
			pstmt.setInt(8,pb.getOneDayPrice());
			pstmt.setString(9,pb.getTitle());
			pstmt.setString(10, pb.getContent());
			pstmt.setInt(11, psBoardNo);
			System.out.println("psboard 저장중");
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateImg(ArrayList<IMG> fileList, Connection con, int psBoardNo) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = prop.getProperty("updateImg");
		
		try {
			for(int i = 0;i<fileList.size();i++) {
				IMG img = fileList.get(i);
				System.out.println(img);
				System.out.println("IMG 저장중");
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, img.getOriginName());
				pstmt.setString(2, img.getChangeName());
				pstmt.setString(3, img.getFilePath());
				pstmt.setInt(4, img.getCategory());
				pstmt.setInt(5, img.getFileLevel());
				pstmt.setInt(6, psBoardNo);
				pstmt.setInt(7, i);
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
