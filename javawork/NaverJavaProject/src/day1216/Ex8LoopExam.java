package day1216;

import java.util.Scanner;

public class Ex8LoopExam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 이름을 입력하면 그 중 "김"씨 성을 가진 사람의 인원수
		 * "이"씨 성을 가진 사람의 인원수
		 * 그 이외의 인원수를 각각 구하여 출력하시오.
		 * (while문 - 빠져나가는 코드는 "끝")
		 * 
		 * 사용할 문자열 메서드 : startsWith, equals
		 * 
		 */
		String names; //입력하는 이름
		int kimCount=0, leeCount=0, otherCount=0;
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("이름 입력 : ");
			names = sc.nextLine();
			
			if (names.equals("끝"))
				break;
			
			if (names.startsWith("김")) //김으로 시작하면
				kimCount++;
			else if (names.startsWith("이")) //이로 시작하면
				leeCount++;
			else
				otherCount += 1;
			
		}
			System.out.println("김씨성 인원 수 : " + kimCount);
			System.out.println("이씨성 인원 수 : " + leeCount);
			System.out.println("낌씨, 이씨를 제외한 인원 수 : " + otherCount);
	
	}
}
