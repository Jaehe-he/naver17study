package day1216;

import java.util.Random;

public class Ex1Random {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 난수를 구하는 방법이 2가지 있다.
		 * 1. Math.random()
		 * 2. Random
		 * 
		 */
		
		System.out.println("Math.random()은 0.0보다 크거나같고 1.0보다 작은 난수 발생");
		for(int i=1;i<=5;i++) {
			System.out.println(Math.random());
		}
		System.out.println("0~9 사이의 난수를 구하는 방법");
		for(int i=1;i<=5;i++) {
			int n=(int)(Math.random()*10); //소수점 없어짐
			System.out.print(n + " ");
		}
		System.out.println();
		System.out.println("0~99 사이의 난수를 구하는 방법");
		for(int i=1;i<=5;i++) {
			int n=(int)(Math.random()*100); //소수점 없어짐
			System.out.print(n + " ");
		}
		System.out.println();
		System.out.println("1~10 사이의 난수를 구하는 방법");
		for(int i=1;i<=5;i++) {
			int n=(int)(Math.random()*10)+1; //소수점 없어짐
			System.out.print(n + " ");
		}
		System.out.println();
		System.out.println("Random 클래스를 이용해서 난수 구하기");
		Random r = new Random(); //인스턴스 변수로 입력되는 값들이 인스턴스 메서드
		System.out.println("0~9까지의 난수 구하기");
		for(int i=1;i<=5;i++) {
			int n=r.nextInt(10);
			System.out.print(n + " ");
		}
		System.out.println();
		
		System.out.println("1~10까지의 난수 구하기");
		for(int i=1;i<=5;i++) {
			int n=r.nextInt(10)+1;
			System.out.print(n + " ");
		}
		System.out.println();
		
		System.out.println("A~Z(65~90)까지의 난수 구하기");
		for(int i=1;i<=5;i++) {
			int n=r.nextInt(26)+65;  //잘알아두기!!!!!
			System.out.print((char)n + " "); //문자 출력이므로 char 붙이기
		}
		System.out.println();
		
	}

}
