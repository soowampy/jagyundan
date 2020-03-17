package petsitter.model.vo;

import java.sql.Date;

public class Reservation {
	private int reservNO;
	private int psBoardNum;
	private int userNo;
	private int dogSu;
	private String startDate;
	private String endDate;
	private int price;
	private String requirment;
	
	public Reservation() { }

	public Reservation(int reservNO, int psBoardNum, int userNo, int dogSu, String startDate, String endDate, int price,
			String requirment) {
		super();
		this.reservNO = reservNO;
		this.psBoardNum = psBoardNum;
		this.userNo = userNo;
		this.dogSu = dogSu;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.requirment = requirment;
	}

	public Reservation(int psBoardNum, int userNo, int dogSu, String startDate, String endDate, int price,
			String requirment) {
		super();
		this.psBoardNum = psBoardNum;
		this.userNo = userNo;
		this.dogSu = dogSu;
		this.startDate = startDate;
		this.endDate = endDate;
		this.price = price;
		this.requirment = requirment;
	}

	
	public Reservation(int psBoardNum, int dogSu, String startDate, String endDate) {
		super();
		this.psBoardNum = psBoardNum;
		this.dogSu = dogSu;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getReservNO() {
		return reservNO;
	}

	public void setReservNO(int reservNO) {
		this.reservNO = reservNO;
	}

	public int getPsBoardNum() {
		return psBoardNum;
	}

	public void setPsBoardNum(int psBoardNum) {
		this.psBoardNum = psBoardNum;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDogSu() {
		return dogSu;
	}

	public void setDogSu(int dogSu) {
		this.dogSu = dogSu;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRequirment() {
		return requirment;
	}

	public void setRequirment(String requirment) {
		this.requirment = requirment;
	}

	@Override
	public String toString() {
		return "Reservation [reservNO=" + reservNO + ", psBoardNum=" + psBoardNum + ", userNo=" + userNo + ", dogSu="
				+ dogSu + ", startDate=" + startDate + ", endDate=" + endDate + ", price=" + price + ", requirment="
				+ requirment + "]";
	}
}
