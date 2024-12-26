package day1212;

import java.util.Date;
import java.util.Scanner;

public class Ex11Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		/*
		 *  년(year),월(month),일(day) 를 입력후
		 *  해당날짜에 대한 Date 클래스를 생성후(myDate)
		 *  myDate 를 이용해서 년도,월,일,요일(week)을 구해서 출력하시오
		 *  요일은 요일숫자(weekNum)를 먼저 얻은후 요일을 구해서 출력
		 *  
		 */
		int year,month,day,weekNum;
		String week;
		Date myDate;
		System.out.println("년도 입력");
		year=sc.nextInt();
		System.out.println("월 입력");
		month=sc.nextInt();
		System.out.println("일 입력");
		day=sc.nextInt();
		
		//입력한 날짜에 대한 Date 클래스 생성
		myDate=new Date(year-1900, month-1, day);
		
		weekNum=myDate.getDay();//요일숫자
		
		System.out.println("년도 : "+(myDate.getYear()+1900));
		System.out.println("월 : "+(myDate.getMonth()+1));
		System.out.println("일 : "+myDate.getDate());
		System.out.println((weekNum==0?"일":weekNum==1?"월":weekNum==2?"화":
			weekNum==3?"수":weekNum==4?"목":weekNum==5?"금":"토")+"요일입니다");
	}

}



















