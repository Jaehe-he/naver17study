package day1211;

public class Ex1DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		byte a = 127;
		byte b = (byte)128; //(byte) : 강제 형변환 - cast 연산자
		byte c = (byte)200;
		byte d = (byte)161;
		System.out.println("a=" + a); //결과 : 127
		System.out.println("b=" + b); //결과 : -128 =? 틀린값이 나온다. 범위를 벗어나기 때문
		System.out.println("c=" + c); //결과 : -56 => 2의 보수로 계산해서 나온 값
		System.out.println("d=" + d); //결과 : -95
	}

}
