package day1212;

import java.util.Scanner;

public class Ex14If {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		
		int score;
		String grade;
		
		System.out.println("점수를 입력해주세요");
		score=sc.nextInt();
		
		//점수가 0~100 의 값을 벗어나면 메서드 종료
		//if(!(score>=0 && score<=100))//방법1
		if(score<0 || score>100)//방법2
		{
			System.out.println("값의 범위를 벗어났습니다");
			return;//현재 메서드를 종료한다
		}
		
		if(score>=90)
			grade="A";
		else if(score>=80)
			grade="B";
		else if(score>=70)
			grade="C";
		else if(score>=60)
			grade="D";
		else
			grade="F";
		
		System.out.printf("%d 점의 학점은 %s학점입니다\n",score,grade);
			
	}

}
