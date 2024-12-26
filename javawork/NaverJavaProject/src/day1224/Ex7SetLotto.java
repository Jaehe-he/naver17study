package day1224;

import java.util.Scanner;
import java.util.Set;
import java.util.TreeSet;

public class Ex7SetLotto {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		int money;
		
		System.out.println("로또를 구입할 금액을 입력하세요");
		money=sc.nextInt();
		if(money<1000)
		{
			System.out.println("금액이 부족합니다");
			return;
		}
		
		for(int i=0;i<money/1000;i++)
		{
			Set<Integer> setLotto=new TreeSet<Integer>();
			System.out.print(i+1+"회:");
			
			while(true)
			{
				int n=(int)(Math.random()*45)+1;
				setLotto.add(n);//중복숫자는 한번만 추가됨
				if(setLotto.size()==6)
					break;
			}
			
			for(Integer lotto:setLotto)
				System.out.printf("%3d",lotto);
			System.out.println();
		}
	}

}








