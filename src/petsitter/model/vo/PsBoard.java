package petsitter.model.vo;

import java.sql.Date;

public class PsBoard {
	private int psBoardNo;
	private Date enrollDate;
	private int hourPrice;
	private String service;
	private String careSize;
	private String careAge;
	private int psNo;
	private String checkIn;
	private String checkOut;
	private int oneDayPrice;
	private String title;
	private String content;
	private String status;
	
	
	public PsBoard() { }
	
	public PsBoard(int psBoardNo, Date enrollDate, int hourPrice, String service, String careSize, String careAge,
			int psNo, String checkIn, String checkOut, int oneDayPrice, String title, String content, String status) {
		super();
		this.psBoardNo = psBoardNo;
		this.enrollDate = enrollDate;
		this.hourPrice = hourPrice;
		this.service = service;
		this.careSize = careSize;
		this.careAge = careAge;
		this.psNo = psNo;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.oneDayPrice = oneDayPrice;
		this.title = title;
		this.content = content;
		this.status = status;
	}







	public PsBoard(int hourPrice, String service, String careSize, String careAge, int psNo, String checkIn,
			String checkOut, int oneDayPrice, String title, String content) {
		super();
		this.hourPrice = hourPrice;
		this.service = service;
		this.careSize = careSize;
		this.careAge = careAge;
		this.psNo = psNo;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.oneDayPrice = oneDayPrice;
		this.title = title;
		this.content = content;
	}



	public int getPsBoardNo() {
		return psBoardNo;
	}
	public void setPsBoardNo(int psBoardNo) {
		this.psBoardNo = psBoardNo;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getHourPrice() {
		return hourPrice;
	}
	public void setHourPrice(int hourPrice) {
		this.hourPrice = hourPrice;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getCareSize() {
		return careSize;
	}
	public void setCareSize(String careSize) {
		this.careSize = careSize;
	}
	public String getCareAge() {
		return careAge;
	}
	public void setCareAge(String careAge) {
		this.careAge = careAge;
	}
	public int getPsNo() {
		return psNo;
	}
	public void setPsNo(int psNo) {
		this.psNo = psNo;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getOneDayPrice() {
		return oneDayPrice;
	}
	public void setOneDayPrice(int oneDayPrice) {
		this.oneDayPrice = oneDayPrice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PsBoard [psBoardNo=" + psBoardNo + ", enrollDate=" + enrollDate + ", hourPrice=" + hourPrice
				+ ", service=" + service + ", careSize=" + careSize + ", careAge=" + careAge + ", psNo=" + psNo
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", oneDayPrice=" + oneDayPrice + ", title="
				+ title + ", content=" + content + ", status=" + status + "]";
	}
	
	
	
	
	
}
