package day1224;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Ex6Set {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Set<String> set1=new HashSet<String>();
		Set<String> set2=new TreeSet<String>();
		
		set1.add("강리나");
		set1.add("이홍기");
		set1.add("강리나");
		set1.add("이영자");
		
		set2.add("강리나");
		set2.add("이홍기");
		set2.add("강리나");
		set2.add("이영자");
		
		System.out.println("set1 의 갯수:"+set1.size());
		System.out.println("set2 의 갯수:"+set2.size());
		
		System.out.println("HashSet 으로 출력");
		for(String s :set1)
			System.out.print(s+" ");
		System.out.println();
		System.out.println("TreeSet 으로 출력");
		for(String s :set2)
			System.out.print(s+" ");
		System.out.println();
		Iterator<String> iter=set2.iterator();
		//데이타를 출력하는 다른 방법
		while(iter.hasNext())
			System.out.print(iter.next()+" ");
		System.out.println();
		
	}

}










