package day1226;

public class Sawon {
	private String sawonName;
	private int age;
	private String hp; //핸드폰
	private String address;
	
	public Sawon() {
		//TODO Auto-generated constructor stub
	}
	
	public Sawon(String sawonName, int age, String hp, String address) {
//		super(); //상속 받을 때 사용하나, 상속 안받더라도 유무 상관은 없음
		this.sawonName = sawonName;
		this.age = age;
		this.hp = hp;
		this.address = address;
	}

	public String getSawonName() {
		return sawonName;
	}

	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
	
	
	
