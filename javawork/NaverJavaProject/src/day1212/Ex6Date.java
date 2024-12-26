package day1212;

import java.util.Date;

public class Ex6Date {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//현재 날짜와 시간을 얻어보자
		//Date 클래스는 jdk1.1 이후에 deprecate 됨- Calendar 를 권장
		Date today=new Date();
		
		int curYear=today.getYear()+1900;//1900 을 뺀값을 반환
		int curMonth=today.getMonth()+1;//0~11 을 반환하므로 +1을 해야한다
		int curDate=today.getDate();
		
		System.out.println("현재년도:"+curYear);
		System.out.println("현재월:"+curMonth);
		System.out.println("현재일:"+curDate);
		
		System.out.println(today.getHours()+"시"+today.getMinutes()+"분");
		
		//요일 숫자 구하기(0~6 : 일~토)
		int weekDay=today.getDay();
		System.out.println(weekDay);
		
		//오늘은 목요일입니다
		String week=weekDay==0?"일":weekDay==1?"월":weekDay==2?"화":
			weekDay==3?"수":weekDay==4?"목":weekDay==5?"금":"토";
		
		System.out.println("오늘은 "+week+"요일입니다");
	}

}













