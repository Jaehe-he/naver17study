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
		
		/*
		//내가 푼 답
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
	*/
		//강사님께서 푼 답
		//0~100세를 벗어나는 경우 다시 입력(인원수 제외)
		//continue : for문은 i++로 이동
		Scanner sc = new Scanner(System.in);
		int count1 = 0, count2 = 0, sum = 0, age =0;
		double avg;
		
		for(int i=1;i<=5;i++) {
			System.out.println(i + "번째 나이 입력");
			age=sc.nextInt();
			if (age < 0 || age > 100) {
				System.out.println("다시 입력하세요");
				i--; //i--안해주면 i는 증가한 상태로 입력되기 때문에 무조건 필요!!!!
				continue;
			}
			sum+=age;
			if(age>=40)
				count1++;
			else
				count2++;
		}
		avg=(double)sum/5; //avg=sum/5.0이렇게 적어도 됨
		
		System.out.println("40세 이상 인원 수 : "+count1);
		System.out.println("40세 미만 인원 수 : "+count2);
		System.out.println("평균 나이 : "+avg);
	}
}
