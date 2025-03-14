package day1211;

public class Ex2DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int kor = 90;
		int eng = 93;
		System.out.println("합계 = " + kor + eng); //String + int + int : 묵시적 형변환에 의해서 String+int = String
		//int+int = int이므로 먼저 계산을 하게 하고 String으로 변환
		System.out.println("합계 = " + (kor + eng));
	
		//진법변환
		int a = 056; //8진수로 인식
		int b = 0x12a; //16진수로 인식
		System.out.println("a="+a); //8진수를 10진수로 변경하는 방법 : 5*8(8¹) + 6*1(8º) = 46
		System.out.println("b="+b); //16진수를 10진수로 변경하는 방법 : 1*256(16²) + 2*16(16¹) + 10*1(16º) = 256+32+10 = 298
	
		int c = 047;
		int d = 0x99;
		System.out.println("c="+c); //4*8+7*1 = 39
		System.out.println(("d="+d)); //10*16+9*1 = 169
	}

}
