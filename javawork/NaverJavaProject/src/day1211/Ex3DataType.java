package day1211;

public class Ex3DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		float f1 = 3.6f;
		double f2=5.6;
		System.out.println("f1="+f1);
		System.out.println("f2="+f2);
		
		float f3 = 2.123456789f;
		double f4 = 2.123465789;
		
		System.out.println("f3="+f3);
		System.out.println("f4="+f4);
		
		//printf : jdk5부터 추가된 기능, 변환기호를 이용한 출력문 = 실수형 : %f
		//제어문자열 : \n(줄넘김), \t(다음탭), \\ : \한번만 출력, \" :"출력
		System.out.printf("f3=%f\n f4=%f\n\n", f3,f4); //변환기호 갯수만큼 변수명 나열
		System.out.printf("f3=%5.1f\nf4=%5.2f\n\n",f3,f4); //%5.1f:전체 자릿수 5, 소숫점 자리수 1
	}

}
