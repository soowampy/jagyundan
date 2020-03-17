package purchase.model.vo;

import java.sql.Date;

public class Purchase {
	private int buy_no; //구매 번호
	private int user_no; // 유저 번호
	private int product_no; // 물품 번호  
	private String get_people; // 받는 사람 
	private String get_where; // 받는 주소 
	private String get_phone; // 받는 폰 번호 
	private int amount; // 구매 수량 
	private int price; // 구매가격 
	private Date buy_date; // 구매 날짜  
	private String box_num; //운송장 번호	
	private String refund; // 구매 취소 여부
	
	
	public Purchase() {}
	
	
	public Purchase(int buy_no, int user_no, int product_no, String get_people, String get_where, String get_phone,
			int amount, int price, Date buy_date, String box_num, String refund) {
		super();
		this.buy_no = buy_no;
		this.user_no = user_no;
		this.product_no = product_no;
		this.get_people = get_people;
		this.get_where = get_where;
		this.get_phone = get_phone;
		this.amount = amount;
		this.price = price;
		this.buy_date = buy_date;
		this.box_num = box_num;
		this.refund = refund;
	}
	

	public int getBuy_no() {
		return buy_no;
	}
	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	
	public String getGet_people() {
		return get_people;
	}
	public void setGet_people(String get_people) {
		this.get_people = get_people;
	}
	
	public String getGet_where() {
		return get_where;
	}
	public void setGet_where(String get_where) {
		this.get_where = get_where;
	}
	
	public String getGet_phone() {
		return get_phone;
	}
	public void setGet_phone(String get_phone) {
		this.get_phone = get_phone;
	}
	
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	
	public String getBox_num() {
		return box_num;
	}
	public void setBox_num(String box_num) {
		this.box_num = box_num;
	}
	
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	
	@Override
	public String toString() {
		return "Purchase [buy_no=" + buy_no + ", user_no=" + user_no + ", product_no=" + product_no + ", get_people="
				+ get_people + ", get_where=" + get_where + ", get_phone=" + get_phone + ", amount=" + amount
				+ ", price=" + price + ", buy_date=" + buy_date + ", box_num=" + box_num + ", refund=" + refund + "]";
	}
}
