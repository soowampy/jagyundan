package petsitter.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Comment;
import petsitter.model.dao.PsBoardInfoDao;
import petsitter.model.dao.PsReservInfoDao;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.Reservation;
import static common.JDBCTemplate.*;

public class PsReservInfoService {

	public int insertReserv(Reservation reserv) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().insertReserv(reserv,con);
		close(con);
		return result;
	}

	public int deleteReserv(int reservNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().deleteReserv(reservNo,con);
		return 0;
	}

	public ArrayList<Reservation> selectReservList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<Reservation> list = new PsReservInfoDao().selectReservList(con);
		return null;
	}

	public Reservation selectReserv(int reservNO) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		Reservation reservation = new PsReservInfoDao().selectReserv(reservNO,con);
		return null;
	}

	public int updateSchedule(String psch, int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int insertSchedule = new PsReservInfoDao().updateSchedule(con,psch,psNo);
		close(con);
		return insertSchedule;
	}
	public Reservation checkUserNo(int userNo, int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		Reservation reserv = new PsReservInfoDao().checkUserNo(con,userNo,psBoardNo);
		close(con);
		return reserv;
	}

	public int insertReply(Comment comment) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().insertReply(con,comment);
		close(con);
		return result;
	}

	public int updateReply(Comment comment, int commentNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().updateReply(con,comment,commentNo);
		close(con);
		return result;
	}

	public int insertScore(int score, int userNo, int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().insertScore(con,userNo,psBoardNo,score);
		close(con);
		return result;
	}

	public double getAvgScore(int psBoardNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		double avgScore = new PsReservInfoDao().getAvgScore(con,psBoardNo);
		close(con);
		return avgScore;
	}

	public int insertScore2(int avgScore2,int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsReservInfoDao().insertScore2(con,avgScore2,psNo);
		close(con);
		return result;
	}

	public int updateScore(int score, int userNo, int psBoardNo) {
		Connection con = getConnection();
		int result = new PsReservInfoDao().updateScore(con,userNo,psBoardNo,score);
		close(con);
		return result;
	}
	
	
}
