package day1224;

import java.util.Arrays;
import java.util.List;

public class Ex11ListVector {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list1=Arrays.asList("장미꽃","안개꽃","국화꽃","다알리아");
		System.out.println("list1의 크기:"+list1.size());
		
		List<Integer> list2=Arrays.asList(56,67,100,90,80);
		System.out.println("list2의 크기:"+list2.size());
		
		System.out.println("list1 출력");
		for(String s:list1)
			System.out.println(s);
		
		System.out.println("=".repeat(20));
		System.out.println("list2 출력");
		for(int n:list2)
			System.out.println(n);
		
		
	}

}
