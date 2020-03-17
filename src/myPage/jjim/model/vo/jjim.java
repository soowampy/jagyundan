package myPage.jjim.model.vo;

public class jjim {
	public jjim() {}
	
	private int jjimNo;
	private int userNo;
	private int productNo;
	
	private String productName;
	private int price;
	public jjim(int jjimNo, int productNo, String productName, int price,int userNo) {
		super();
		this.jjimNo = jjimNo;
		this.productNo = productNo;
		this.productName = productName;
		this.userNo = userNo;
		this.price = price;
	}
	public jjim(int jjimNo, int userNo, int productNo) {
		super();
		this.jjimNo = jjimNo;
		this.userNo = userNo;
		this.productNo = productNo;
	}
	public int getJjimNo() {
		return jjimNo;
	}
	public void setJjimNo(int jjimNo) {
		this.jjimNo = jjimNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "jjim [jjimNo=" + jjimNo + ", userNo=" + userNo + ", productNo=" + productNo + ", productName="
				+ productName + ", price=" + price + "]";
	}
	
	
	
}
