package day1219;

/*
 * <인자 전달 방식>
 * 1. CallByValue : 값만 전달 (기본형, String) -> 값 변경 시 return으로 가져와야함(참고! public static int changeScore(int score) {)
 * 2. CallByReference : 주소가 전달 (모든 객체, 배열타입)
 */

class Test{
	String message;
	int code;
	
}

/////////////////////////////////////

public class Ex5CallBy {
	
	public static void changeInt(int n) { //주소가 다르게 새로 생성
		n=200;
		
	}
	
	public static void changeString(String s) {
		s = "apple";
	}

	public static void changeTest(Test t) {
		t.message="Happy";
		t.code=100;
	}
	
	public static void changeArray(int []arr) {
		arr[1]=20;
	}
	
	public static int changeScore(int score) {
		if(score>=80)
			return score;
		else
			return 90;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int n=100;
		changeInt(n);//값만 전달
		System.out.println("n=" + n);
		
		String s = "Berry";
		changeString(s);//값만 전달
		System.out.println(s);
		
		Test t = new Test();
		System.out.println("message="+t.message+",code="+t.code);
		changeTest(t); //주소가 전달
		System.out.println("message="+t.message+",code="+t.code);
	
		//배열
		int []a = {5, 8, 11};
		changeArray(a);
		for(int aa:a)
			System.out.print(aa+" ");
		System.out.println();
	
		int score = 70;
		//값만 전달되는 경우는 메서드에서 변경된 값을 받으려면 리턴으로 받아와야한다
		score=changeScore(score);
		System.out.println("score="+score);
	}

}
