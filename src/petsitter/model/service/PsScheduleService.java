package petsitter.model.service;

import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import petsitter.model.dao.PsBoardInfoDao;
import petsitter.model.dao.PsScheduleDao;
import petsitter.model.vo.PsBoard;
import petsitter.model.vo.PsSchedule;

public class PsScheduleService {

	public int deleteSchedule(int scheduleNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsScheduleDao().deleteSchedule(scheduleNo,con);
		return 0;
	}

	public int insertSchedule(PsSchedule psSchedule) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsScheduleDao().insertSchedule(psSchedule,con);
		return 0;
	}

	public int updateSchedule(int scheduleNo, PsSchedule psSchedule) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		int result = new PsScheduleDao().updateSchedule(psSchedule,scheduleNo,con);
		return 0;
	}

	public ArrayList<PsSchedule> scheduleList() {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		ArrayList<PsSchedule> list = new PsScheduleDao().scheduleList(con);
		return null;
	}

	public PsSchedule selectSchedule(int scheduleNo) {
		// TODO Auto-generated method stub
		Connection con = getConnection();
		PsSchedule psSchedule = new PsScheduleDao().selectSchedule(scheduleNo,con);
		return null;
	}

}
