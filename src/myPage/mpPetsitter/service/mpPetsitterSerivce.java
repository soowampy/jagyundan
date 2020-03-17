package myPage.mpPetsitter.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.Petsitter.model.vo.AdminPetsitterDao;
import board.model.vo.Board;
import myPage.mpPetsitter.dao.mpPetsitterDao;
import petsitter.model.vo.PsInfo;
import petsitter.model.vo.PsSchedule;
import petsitter.model.vo.Reservation;
import user.model.dao.UserDao;
import user.model.vo.User;

public class mpPetsitterSerivce {

	public PsInfo checkUser(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		PsInfo ps = new mpPetsitterDao().checkUser(con,userNo);
		
		close(con);
		
		return ps;
	}
	
	//스케줄 입력(사실상초기값)
	public PsInfo insertSch(int userNo,int psNo, String sch) {
		Connection conn = getConnection();
		PsInfo updateSch = null;
		// 스케줄입력하기
		int result = new mpPetsitterDao().insertSch(conn, userNo, psNo, sch);
		if(result > 0) {
			// 업데이트 성공 시
			updateSch = new mpPetsitterDao().checkUser(conn,userNo);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateSch;
	}
	
	//스케줄 수정
	public PsInfo updateSch(int userNo,int psNo, String sch) {
		Connection conn = getConnection();
		PsInfo updateSch = null;
		// 스케줄 입력하기
		int result = new mpPetsitterDao().updateSch(conn, userNo, psNo, sch);
		if(result > 0) {
			// 업데이트 성공 시
			updateSch = new mpPetsitterDao().checkUser(conn,userNo);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		System.out.println("ㅋㅋ"+updateSch);
		return updateSch;
	}
	
	//스케줄 정보 갖고오기
	public PsSchedule selectSch(int userNo) {
		Connection con = getConnection();
		PsSchedule ps = new mpPetsitterDao().selectSch(con,userNo);
		close(con);
		return ps;
	}

	public ArrayList<Reservation> selectSchList(int psNo) {
		Connection conn = getConnection();

		ArrayList<Reservation> list = new mpPetsitterDao().selectSchList(conn,psNo);
		close(conn);
		return list;
	}

	public  ArrayList<Reservation>  petsitterUseList(int userNo) {
		Connection conn = getConnection();

		ArrayList<Reservation> list = new mpPetsitterDao().petsitterUseList(conn,userNo);
		close(conn);
		return list;
	}
}
