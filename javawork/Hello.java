public class Hello {
	public static void main(String []args) { //args는 다른 변수명으로 바꿔도 됨
		//여러줄 주석처리
		/*
		System.out.println("Hello~");
		System.out.println("안녕하세요");
		*/

		//변수 value 선언 <-- 설명문으로 인식 (// : 한줄 주석문, /**/ : 여러 줄 주석문)
		int value;
		//value에 정수값 저장하기
		value=7;
		System.out.println("value=" + value);
	}
}