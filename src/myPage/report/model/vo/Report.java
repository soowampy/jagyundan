package myPage.report.model.vo;

public class Report {
	public Report() {};
	
	private int reportNo;	//신고번호
	private String reason;	//신고이유
	private int singo; //카테고리 1-불량유저신고 2-불량펫시터신고 3-상품문의 4-배송문의 5-주문/결제문의
	private String title; //신고제목
	private String wDate; //신고날짜
	private String admin; //신고상태
	private String refer; //신고참고
	private String reply; //답변
	
	
	
	public Report(int reportNo, String reason, int singo, String title, String wDate, String admin, String refer,
			int userNo,String reply) {
		super();
		this.reportNo = reportNo;
		this.reason = reason;
		this.singo = singo;
		this.title = title;
		this.wDate = wDate;
		this.admin = admin;
		this.refer = refer;
		this.userNo = userNo;
		this.reply = reply;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Report(String reason, int singo, String title, String refer, int userNo) {
		super();
		this.reason = reason;
		this.singo = singo;
		this.title = title;
		this.refer = refer;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "report [reportNo=" + reportNo + ", reason=" + reason + ", singo=" + singo + ", title=" + title
				+ ", wDate=" + wDate + ", admin=" + admin + ", refer=" + refer + ", userNo=" + userNo + "]";
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public int getSingo() {
		return singo;
	}

	public void setSingo(int singo) {
		this.singo = singo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getRefer() {
		return refer;
	}

	public void setRefer(String refer) {
		this.refer = refer;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Report(int reportNo, String reason, int singo, String title, String wDate, String admin, String refer,
			int userNo) {
		super();
		this.reportNo = reportNo;
		this.reason = reason;
		this.singo = singo;
		this.title = title;
		this.wDate = wDate;
		this.admin = admin;
		this.refer = refer;
		this.userNo = userNo;
	}

	private int userNo; //회원번호
	
	
}
