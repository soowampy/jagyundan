package common.model.vo;

import java.util.Date;

public class IMG {
	private int IMGNum;
	private int boardNo;
	private int productNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date UploadDate;
	private String status;
	private int category;
	private int fileLevel;
	private int userNo;

	public IMG() {
	}

	public IMG(int iMGNum, int boardNo, int productNo, String originName, String changeName, String filePath,
			Date uploadDate, String status, int category, int fileLevel, int userNo) {
		super();
		IMGNum = iMGNum;
		this.boardNo = boardNo;
		this.productNo = productNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		UploadDate = uploadDate;
		this.status = status;
		this.category = category;
		this.fileLevel = fileLevel;
		this.userNo = userNo;
	}

	public int getIMGNum() {
		return IMGNum;
	}

	public void setIMGNum(int iMGNum) {
		IMGNum = iMGNum;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return UploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		UploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "IMG [IMGNum=" + IMGNum + ", boardNo=" + boardNo + ", productNo=" + productNo + ", originName="
				+ originName + ", changeName=" + changeName + ", filePath=" + filePath + ", UploadDate=" + UploadDate
				+ ", status=" + status + ", category=" + category + ", fileLevel=" + fileLevel + ", userNo=" + userNo
				+ "]";
	}

}