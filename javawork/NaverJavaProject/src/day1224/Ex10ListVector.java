package day1224;

import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class Ex10ListVector {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> list1=new Vector<String>();//기본 10개가 할당
		//List<String> list2=new Vector<String>(5);//기본 5개가 할당
		List<String> list2=new Vector<String>(5,3);//기본 5개가 할당,3개씩 증가
		
		System.out.println("list1 의 데이타 갯수"+list1.size()+",할당갯수:"
				+((Vector<String>)list1).capacity());//capacity()메서드는 오버라이드 메서드가 아님
		System.out.println("list2 의 데이타 갯수"+list2.size()+",할당갯수:"
				+((Vector<String>)list2).capacity());//capacity()메서드는 오버라이드 메서드가 아님

		
		list2.add("김상아");
		list2.add("이미자");
		list2.add("홍상수");
		list2.add("이진");
		list2.add("이효리");
		list2.add("김상아");
		list2.add("이진");
		
		System.out.println("list2 의 데이타 갯수"+list2.size()+",할당갯수:"
				+((Vector<String>)list2).capacity());//capacity()메서드는 오버라이드 메서드가 아님

		System.out.println("출력 방법 1");
		for(String s:list2)
			System.out.print(s+" ");
		System.out.println();
		
		System.out.println("출력 방법 2");
		for(int i=0;i<list2.size();i++) {
			System.out.print(i+1+":"+list2.get(i)+" ");			
		}
		System.out.println();
		
		System.out.println("출력 방법 3");
		Iterator<String> iter=list2.iterator();
		while(iter.hasNext())
			System.out.print(iter.next()+" ");
		System.out.println();
		
		System.out.println("출력 방법 4");
		Object []ob=list2.toArray();
		for(Object s:ob)
			System.out.print(s+" ");
	}

}















