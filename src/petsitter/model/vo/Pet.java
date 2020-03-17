package petsitter.model.vo;

public class Pet {
	private int dogNum;
	private String dogName;
	private String gender;
	private String size;
	private String neutralize;
	private String vaccination;
	private int age;
	private String toiletTrain;
	private int userNo;
	
	public Pet() { }

	
	
	
	public Pet(String dogName, String gender, String size, String neutralize, String vaccination, int age,
			String toiletTrain, int userNo) {
		super();
		this.dogName = dogName;
		this.gender = gender;
		this.size = size;
		this.neutralize = neutralize;
		this.vaccination = vaccination;
		this.age = age;
		this.toiletTrain = toiletTrain;
		this.userNo = userNo;
	}




	public Pet(int dogNum, String dogName, String gender, String size, String neutralize, String vaccination, int age,
			String toiletTrain, int userNo) {
		super();
		this.dogNum = dogNum;
		this.dogName = dogName;
		this.gender = gender;
		this.size = size;
		this.neutralize = neutralize;
		this.vaccination = vaccination;
		this.age = age;
		this.toiletTrain = toiletTrain;
		this.userNo = userNo;
	}

	public int getDogNum() {
		return dogNum;
	}

	public void setDogNum(int dogNum) {
		this.dogNum = dogNum;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getNeutralize() {
		return neutralize;
	}

	public void setNeutralize(String neutralize) {
		this.neutralize = neutralize;
	}

	public String getVaccination() {
		return vaccination;
	}

	public void setVaccination(String vaccination) {
		this.vaccination = vaccination;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getToiletTrain() {
		return toiletTrain;
	}

	public void setToiletTrain(String toiletTrain) {
		this.toiletTrain = toiletTrain;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Pet [dogNum=" + dogNum + ", dogName=" + dogName + ", gender=" + gender + ", size=" + size
				+ ", neutralize=" + neutralize + ", vaccination=" + vaccination + ", age=" + age + ", toiletTrain="
				+ toiletTrain + ", userNo=" + userNo + "]";
	}
}
