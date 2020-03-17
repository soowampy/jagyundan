package productBoard.model.vo;

import java.util.Date;

public class pComment {
	private int commentNo;
	private String content;
	private int boardNo;
	private int userNo;
	private int productNo;
	private int petsitterNo;
	private String userName;
	private String status;
	private Date enrollDate;
	private String changeName;
	
	public pComment() {}

	
	public pComment(int commentNo, String content, int boardNo, int userNo, int productNo, int petsitterNo,
			String userName, String status, Date enrollDate, String changeName) {
		super();
		this.commentNo = commentNo;
		this.content = content;
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.petsitterNo = petsitterNo;
		this.userName = userName;
		this.status = status;
		this.enrollDate = enrollDate;
		this.changeName = changeName;
	}




	

	public pComment(int commentNo, String content, int productNo, String userName, String status, Date enrollDate,
			String changeName) {
		super();
		this.commentNo = commentNo;
		this.content = content;
		this.productNo = productNo;
		this.userName = userName;
		this.status = status;
		this.enrollDate = enrollDate;
		this.changeName = changeName;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public int getPetsitterNo() {
		return petsitterNo;
	}


	public void setPetsitterNo(int petsitterNo) {
		this.petsitterNo = petsitterNo;
	}


	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", content=" + content + ", boardNo=" + boardNo + ", userNo="
				+ userNo + ", productNo=" + productNo + ", petsitterNo=" + petsitterNo + ", userName=" + userName
				+ ", status=" + status + ", enrollDate=" + enrollDate + ", changeName=" + changeName + "]";
	}


	

	
	

}
