package day1213;

import java.util.Scanner;

public class Ex3Switch {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 년도와 월을 입력 후 윤년인지 평년인지 출력하고
		 * 그 월이 몇일까지 있는지 구하시오.
		 * 윤년이란 년도 % 4 == 0 && 년도 % 100 ! = 0 || 년도 % 400 == 0
		 */
		
		Scanner sc = new Scanner(System.in);
		int year, month, days;
		
		System.out.println("년도와 월을 입력하세요.");
		year = sc.nextInt();
		month = sc.nextInt();
		
		//if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0):
		boolean b = year%4==0 && year%100!=0 || year%400==0; //true면 윤년, false면 평년
		if (b) //b=true 일 경우 그냥 b만 쓰고, b==false일 경우는 !b 이렇게 쓴다.
			System.out.println(year+"년도는 윤년입니다.");
		else
			System.out.println(year+"년도는 평년입니다.");
	
		switch(month)
		{
		case 2:
			days = b?29:28;
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			days=30;
			break;
		case 1: case 3: case 5: case 7: case 8:
		case 10: case 12:
			days=31;
			break;
		default:
			days=-1;
		}
		
		if(days==-1) {
			System.out.println("1~12월을 벗어난 값입니다.");
		} else {
			System.out.printf("%d년 %d월은 %d일까지 있습니다", year, month, days);
		}
	}

}
