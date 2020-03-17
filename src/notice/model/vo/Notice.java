package notice.model.vo;

import java.util.Date;

public class Notice {
	
	private int noticeNo;
	private String title;
	private String content;
	private Date enrollDate;

	public Notice() {}

	public Notice(int noticeNo, String title, String content, Date enrollDate) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.enrollDate = enrollDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", enrollDate="
				+ enrollDate + "]";
	}
	
	
}
