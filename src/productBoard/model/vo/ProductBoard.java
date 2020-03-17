package productBoard.model.vo;

public class ProductBoard {
	private int productNo;//번호
	private int productCate;//카테고리
	private String productName;//제목
	private String productExplain;//내용
	private String status;//상태
	private int amount;//수량
	private int price;//가격
	private String size;
	
	public ProductBoard() {}
	
	public ProductBoard(int productNo, int productCate, String productName, String productExplain, String status,
			int amount, int price, String size) {
		super();
		this.productNo = productNo;
		this.productCate = productCate;
		this.productName = productName;
		this.productExplain = productExplain;
		this.status = status;
		this.amount = amount;
		this.price = price;
		this.size = size;
	}
	
	

	public ProductBoard(int productNo, int productCate, String productName, String productExplain, String status,
			int amount, int price) {
		super();
		this.productNo = productNo;
		this.productCate = productCate;
		this.productName = productName;
		this.productExplain = productExplain;
		this.status = status;
		this.amount = amount;
		this.price = price;
	}
	
	

	public ProductBoard(int productNo, String productName, String productExplain, String status, int price,
			String size) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productExplain = productExplain;
		this.status = status;
		this.price = price;
		this.size = size;
	}
	
	

	public ProductBoard(int productNo, int productCate, String productName, String productExplain, String status,
			int price, String size) {
		super();
		this.productNo = productNo;
		this.productCate = productCate;
		this.productName = productName;
		this.productExplain = productExplain;
		this.status = status;
		this.price = price;
		this.size = size;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductCate() {
		return productCate;
	}

	public void setProductCate(int productCate) {
		this.productCate = productCate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductExplain() {
		return productExplain;
	}

	public void setProductExplain(String productExplain) {
		this.productExplain = productExplain;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "ProductBoard [productNo=" + productNo + ", productCate=" + productCate + ", productName=" + productName
				+ ", productExplain=" + productExplain + ", status=" + status + ", amount=" + amount + ", price="
				+ price + ", size=" + size + "]";
	}
	
	

	
	
	
}
