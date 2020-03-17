package petsitter.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.model.vo.IMG;
import petsitter.model.dao.PetSitterInfoDao;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsInfo;
import static common.JDBCTemplate.*;
public class PetSitterInfoService {

	//펫시터 지원 폼을 PS_INFO에 저장하는 부분
	public int insertPs(PsInfo ps) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetSitterInfoDao().insertPs(ps,con);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deletePs(int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetSitterInfoDao().deletePs(psNo,con);
		return 0;
	}

	public int updatePsInfo(PsInfo psInfo,int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PetSitterInfoDao().updatePsInfo(psInfo,psNo,con);
		return 0;
	}

	public ArrayList<PsInfo> selectList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<PsInfo> list = new PetSitterInfoDao().selectList(con);
		return null;
	}

	public PsInfo selectDetail(int psNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		PsInfo psInfo = new PetSitterInfoDao().selectDetail(psNo,con);
		return null;
	}
	//User테이블에서 USER_NO값을 가져오는 부분
	public int getUserNo(String userId) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int userNo = new PetSitterInfoDao().getUserNo(con,userId);
		close(con);
		return userNo;
	}
	//PS_INFO테이블에 해당 user_no로 있는 회원의 정보를 가져오는 부분
	public PsInfo checkUser(int userNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		
		PsInfo ps = new PetSitterInfoDao().checkUser(con,userNo);
		
		close(con);
		
		return ps;
	}

}
