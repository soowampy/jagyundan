package petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Comment;
import common.model.vo.IMG;
import petsitter.model.dao.PsBoardInfoDao;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfoDetail;
import petsitter.model.vo.PsSchedule;

import static common.JDBCTemplate.*;
public class PsBoardInfoService {
	public int deletePsBoard(int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsBoardInfoDao().deleteBoard(psBoardNo,con);
		return 0;
	}

	public int updatePsBoard(PsBoard psBoard,int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsBoardInfoDao().updateBoard(psBoard,psBoardNo,con);
		return 0;
	}
	
	
	
	//펫시터 글 모두 가져오는 부분
	public PsBoard selectPsBoard(int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println("service");
		PsBoard psBoard = new PsBoardInfoDao().selectDetail(psBoardNo,con);
		close(con);
		return psBoard;
	}
	//펫시터 글 저장하는 부분
	public int insertPsBoard(PsBoard pb, ArrayList<IMG> fileList) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		PsBoardInfoDao pDao = new PsBoardInfoDao();
		
		int insertPsB = pDao.insertPsBoard(pb,con);
		System.out.println(pb);
		System.out.println(insertPsB);
		int insertImg = pDao.insertImg(fileList,con);
		System.out.println(insertImg);
		if(insertPsB>0 && insertImg>0) {
			System.out.println("commit 중...");
			commit(con);
			System.out.println("저장 성공");
		}else {
			System.out.println("rollback 중...");
			rollback(con);
		}
		
		close(con);
		
		return insertPsB;
	}

	//펫시터 글 썼는지 체크하는 부분
	public PsBoard checkBoard(int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		System.out.println("PsBoardInfoService : checkBoard");
		PsBoard pb = new PsBoardInfoDao().checkBoard(con,psNo);
		
		close(con);
		
		return pb;
	}

	//펫시터 글들을 모두 뽑아오는 부분(view를 뽑아옴)
	public ArrayList selectList(int i) { //리스트를 뽑아보기 위해서
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println("service : PsBoardInfoService - selectList 함수");
		ArrayList list = null;
		
		PsBoardInfoDao pbd = new PsBoardInfoDao();
		
		if(i == 1) {
			list = pbd.selectBList(con);
			System.out.println("게시판 글 불러오는중");
		}else if(i == 2){
			list = pbd.selectIList(con);
			System.out.println("게시판 사진 불러오는중");
		}else {
			list = pbd.selectPList(con);
			System.out.println("프로필 사진 불러오는중");
		}
		
		close(con);
		
		return list;
	}
	
	//해당 펫시터 글을 쓴 펫시터의 주소와 이름을 가져오는 부분
	public PsInfoDetail selectPsInfoDetail(int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println("service : selectPsInfoDetail");
		PsInfoDetail pid = new PsBoardInfoDao().selectPsInfoDetail(con,psNo);
		close(con);
		System.out.println(pid);
		return pid;
	}

	//선택된 해당 펫시터 글 사진을 불러오는 부분
	public ArrayList<IMG> selectBoardImg(int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println("service : selectBoardImg");
		ArrayList<IMG> iList = new PsBoardInfoDao().selectBoardImg(con,psBoardNo);
		close(con);
		return iList;
	}

	//펫시터 글 쓴 사람의 프로필 사진을 넣는곳
	public IMG selectPsImage(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		System.out.println("PsBoardInfoService : selectUserImage");
		
		IMG psImage = new PsBoardInfoDao().selectPsImage(con,userNo);
		
		close(con);
		
		return psImage;
	}
	
	//해당 펫시터의 스케줄을 가져오는 부분
	public PsSchedule selectPsSchedule(int psNo) {
		// TODO Auto-generated method stub
		System.out.println("PsBoardInfoService : selectPsSchedule");
		Connection con = getConnection();
		
		PsSchedule psch = new PsBoardInfoDao().selectPsSchedule(con, psNo);
		
		close(con);
		return psch;
	}
	//해당 게시글에 있는 댓글 리스트를 뽑기 위해서
	public ArrayList<Comment> selectCommentList(int psBoardNo) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		
		ArrayList<Comment> clist = new PsBoardInfoDao().selectCommentList(conn, psBoardNo);
		close(conn);
		return clist;
	}
	//이사람이 댓글을 썻는지 안썻는지 확인하기 위해서
	public Comment checkComment(int loginUserNo, int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		Comment com = new PsBoardInfoDao().checkComment(con,loginUserNo,psBoardNo);
		close(con);
		return com;
	}

	public int deleteReply(int commentNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsBoardInfoDao().deleteReply(con,commentNo);
		close(con);
		return result;
	}

	public int updatePsBoard(PsBoard pb, ArrayList<IMG> fileList) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		PsBoardInfoDao pDao = new PsBoardInfoDao();
		
		int insertPsB = pDao.insertPsBoard(pb,con);
		System.out.println(pb);
		System.out.println(insertPsB);
		int insertImg = pDao.insertImg(fileList,con);
		System.out.println(insertImg);
		if(insertPsB>0 && insertImg>0) {
			System.out.println("commit 중...");
			commit(con);
			System.out.println("저장 성공");
		}else {
			System.out.println("rollback 중...");
			rollback(con);
		}
		
		close(con);
		
		return insertPsB;
	}

	public int updatePsBoard(PsBoard pb, ArrayList<IMG> fileList, int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		PsBoardInfoDao pDao = new PsBoardInfoDao();
		
		int updatePsB = pDao.updatePsBoard(pb,psBoardNo,con);
		System.out.println(pb);
		System.out.println(updatePsB);
		int updateImg = pDao.updateImg(fileList,con,psBoardNo);
		System.out.println(updateImg);
		if(updatePsB>0 && updateImg>0) {
			System.out.println("commit 중...");
			commit(con);
			System.out.println("저장 성공");
		}else {
			System.out.println("rollback 중...");
			rollback(con);
		}
		
		close(con);
		
		return updatePsB;
	}
	
	
	
	
	
}
