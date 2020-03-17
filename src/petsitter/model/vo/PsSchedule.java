package petsitter.model.vo;

import java.sql.Date;

public class PsSchedule {
	private int scheduleNo;
	private String apDate;
	private int psNo;
	private int userNo;
	
	public PsSchedule() { }

	public PsSchedule(int scheduleNo, String apDate, int psNo, int userNo) {
		super();
		this.scheduleNo = scheduleNo;
		this.apDate = apDate;
		this.psNo = psNo;
		this.userNo = userNo;
	}

	public int getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public String getApDate() {
		return apDate;
	}

	public void setApDate(String apDate) {
		this.apDate = apDate;
	}

	public int getPsNo() {
		return psNo;
	}

	public void setPsNo(int psNo) {
		this.psNo = psNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "PsSchedule [scheduleNo=" + scheduleNo + ", apDate=" + apDate + ", psNo=" + psNo + ", userNo=" + userNo
				+ "]";
	}


	

	
}
