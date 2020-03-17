package user.model.vo;


public class User {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;

	private String changeName;
	private String filePath;

	
	
	
	
	
	
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

	public User(int userNo, String userId, String userPwd, String userName, String gender, String changeName,
			String filePath, String email, String address, int dogSu, String phone, String birth, String admin) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.changeName = changeName;
		this.filePath = filePath;
		this.email = email;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
		this.birth = birth;
		this.admin = admin;
	}

	public User(int userNo, String address, int dogSu, String phone) {
		super();
		this.userNo = userNo;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
	}

	public User(int userNo, String userId, String userPwd, String address, String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.address = address;
		this.phone = phone;
	}

	public User(int userNo, String userId, String address, String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.address = address;
		this.phone = phone;
	}

	public User(int userNo, String userId, String address, int dogSu, String phone) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
	}

	private String email;
	private String address;
	private int dogSu;
	private String phone;
	private String birth;
	private String admin;

	public User() {}

	public User(String userId, String userPwd, String userName, String gender, String email, String address,
			int dogSu, String phone, String birth) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
		this.birth = birth;
	}

	public User(String userId, String userName, String email, String address, int dogSu, String phone,
			String birth) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
		this.birth = birth;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getdogSu() {
		return dogSu;
	}

	public void setdogSu(int dogSu) {
		this.dogSu = dogSu;
	}

	public String getPhone() {
		return phone;
	}

	public int getDogSu() {
		return dogSu;
	}

	public void setDogSu(int dogSu) {
		this.dogSu = dogSu;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "User [userno=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", gender=" + gender + ", email=" + email + ", address=" + address + ", dogSu=" + dogSu
				+ ", phone=" + phone + ", birth=" + birth + ", admin=" + admin + "]";
	}

	public User(int userNo, String userId, String userPwd, String userName, String gender, String email,
			String address, int dogSu, String phone, String birth, String admin) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.dogSu = dogSu;
		this.phone = phone;
		this.birth = birth;
		this.admin = admin;
	}



	
}
