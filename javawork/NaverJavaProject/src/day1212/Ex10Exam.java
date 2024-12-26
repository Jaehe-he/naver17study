package day1212;

import java.util.Scanner;

public class Ex10Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 상품(sang) 과 수량(su),단가(dan) 을 입력받은후
		 * 총금액(total) 을 출력하시오
		 * 단, 수량이 5개 이상이면 총금액의 10프로를 할인된 금액
		 * 으로 출력해주세요
		 * 
		 * (예)
		 * 상품명 : 바나나킥
		 * 수량 : 5개
		 * 단가 : 1000원
		 * 총금액 : 4500원
		 * 
		 */
		Scanner sc=new Scanner(System.in);
		String sang;
		int su,dan,total;
		System.out.println("상품명 입력");
		sang=sc.nextLine();
		System.out.println("수량 입력");
		su=sc.nextInt();
		System.out.println("단가 입력");
		dan=sc.nextInt();
		total=su<5?su*dan:(int)((su*dan)*0.9);
		System.out.println("상품명 : "+sang);
		System.out.println("수량 : "+su+"개");
		System.out.println("단가 : "+dan+"원");
		System.out.println("총금액 : "+total+"원"+(su<5?"":"(할인됨)"));
	}

}











