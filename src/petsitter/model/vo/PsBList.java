package petsitter.model.vo;

public class PsBList {
	private int rnum;
	private int psBoardNo;
	private String title;
	private int hourPrice;
	private int oneDayPrice;
	private String userName;
	private int dogSu;
	private int score;
	private int userNo;
	
	public PsBList() {
		super();
	}
	
	public PsBList(int rnum, int psBoardNo, String title, int hourPrice, int oneDayPrice, String userName, int dogSu,
			int score, int userNo) {
		super();
		this.rnum = rnum;
		this.psBoardNo = psBoardNo;
		this.title = title;
		this.hourPrice = hourPrice;
		this.oneDayPrice = oneDayPrice;
		this.userName = userName;
		this.dogSu = dogSu;
		this.score = score;
		this.userNo = userNo;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getScore() {
		return score;
	}



	public void setScore(int score) {
		this.score = score;
	}



	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getPsBoardNo() {
		return psBoardNo;
	}

	public void setPsBoardNo(int psBoardNo) {
		this.psBoardNo = psBoardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHourPrice() {
		return hourPrice;
	}

	public void setHourPrice(int hourPrice) {
		this.hourPrice = hourPrice;
	}

	public int getOneDayPrice() {
		return oneDayPrice;
	}

	public void setOneDayPrice(int oneDayPrice) {
		this.oneDayPrice = oneDayPrice;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getDogSu() {
		return dogSu;
	}

	public void setDogSu(int dogSu) {
		this.dogSu = dogSu;
	}

	@Override
	public String toString() {
		return "PsBList [rnum=" + rnum + ", psBoardNo=" + psBoardNo + ", title=" + title + ", hourPrice=" + hourPrice
				+ ", oneDayPrice=" + oneDayPrice + ", userName=" + userName + ", dogSu=" + dogSu + ", score=" + score
				+ ", userNo=" + userNo + "]";
	}
	
	
	
	
	
}
