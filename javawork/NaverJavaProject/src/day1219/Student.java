package day1219;

import java.util.Calendar;

public class Student {
	private String stuName;
	private String stuAddress;
	private String stuBlood;
	private int stuBirthYear;
	private int stuScore;
	
	public String getStuName() {
		return stuName;
	}
	
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public String getStuAddress() {
		return stuAddress;
	}

	public void setStuAddress(String stuAddress) {
		this.stuAddress = stuAddress;
	}

	public String getStuBlood() {
		return stuBlood;
	}

	public void setStuBlood(String stuBlood) {
		this.stuBlood = stuBlood;
	}

	public int getStuBirthYear() {
		return stuBirthYear;
	}

	public void setStuBirthYear(int stuBirthYear) {
		this.stuBirthYear = stuBirthYear;
	}

	public int getStuScore() {
		return stuScore;
	}

	public void setStuScore(int stuScore) {
		this.stuScore = stuScore;
	}
	
	//3가지는 한번에 변경할 경우
	public void changeStudent(String stuName, String stuAddress, String stuBlood) {
		this.setStuName(stuName);
		this.setStuAddress(stuAddress);
		this.setStuBlood(stuBlood);
	}
	
	//stuScore에 대한 절대평가(A~F) 반환하는 메서드
	public char getScoreGrade() {
		char grade=switch(stuScore/10) {
		case 10,9 -> 'A';
		case 8 -> 'B';
		case 7 -> 'C';
		case 6 -> 'D';
		default -> 'F';
		};
		return grade;
	}
	
	//stuBirthYear로 나이를 구해서 반환
	public int getAge() {
		//현재 년도
		//Calendar를 이용해서 현재 년도를 구해보자
		Calendar cal = Calendar.getInstance();
		int curYear = cal.get(Calendar.YEAR);
		
		return curYear-stuBirthYear;
	}
}
