package day1224;

import java.util.Stack;

public class Ex9Stack {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//LIFO : last in first out :마지막으로 들어간 데이타가 먼저 나오는 구조
		//push,pop 을 이용해서 데이타를 추가,제거
		Stack<String> stack1=new Stack<String>();
		
		stack1.push("사과");
		stack1.push("오렌지");
		stack1.push("사과");
		stack1.push("키위");
		stack1.push("딸기");
		
		System.out.println("statck 의 갯수:"+stack1.size());
		
		while(!stack1.isEmpty())
		{
			System.out.println(stack1.pop());
		}
		
	}

}







