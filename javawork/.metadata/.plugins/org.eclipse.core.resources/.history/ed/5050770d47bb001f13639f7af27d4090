package day1213;

import java.util.Scanner;

public class Ex13For {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 문제 2
		 * 5명의 나이를 입력 후
		 * 40세 이상과 40세 미만이 각각 몇명인지 출력하고
		 * 평균 나이도 같이 출력하시오
		 * (for문 사용) 
		 */
		
		Scanner sc = new Scanner(System.in);
		int countup = 0, countdown = 0;
		int sum = 0;
		double avg;
		
		for(int i = 1; i <= 5; i++) {
			System.out.print("나이 입력 : ");
			int age = sc.nextInt();
			sum += age;
			if (age < 40) 
				countdown += 1;
			else
				countup += 1;	
		}
		avg = (double)sum/5;
		System.out.printf("40세 이상 : %d\n",countup);
		System.out.printf("40세 미만 : %d\n", countdown);
		System.out.printf("평균 나이 : %5.2f", avg);
	}

}
