package day1219;

public class Ex6VarArgs {

	public static void writeColor(String color1) {
		System.out.println("color1="+color1);
	}
	
	public static void writeColor(String color1, String color2) {
		System.out.println("color1="+color1+ " , color2 = "+color2);
	}
	
	public static void writeColor(String color1, String color2, String color3) {
		System.out.println("color1="+color1+ " , color2 = " + color2 + " , color3 = " + color3);
	}
	
	public static void writeName(String ... name) { //...은 배열 타임으로 전달받기 때문에 갯수가 미정일 경우 사용하면 좋음
		System.out.println("name의 length:"+name.length);
		if(name.length == 0)
			System.out.println("멤버가 없습니다.");
		else {
			System.out.println("** 멤버 목록 **");
			for(String n:name)
				System.out.println("\t"+n);
			System.out.println("=".repeat(20));
		}
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		writeColor("red"); //writeColor는 오버로딩으로 만들었기 때문에 인수 없으면 오류
		writeColor("yellow", "green");
		writeColor("white", "orange", "black");
//		writeColor("white", "orange", "black", "red"); //오류 발생 - 해당 오버로딩 메서드가 존재하지 않는다 => 해결 : ...
	
		System.out.println("Variable Arguments 기능을 이용해서 인자로 여러 문자열을 보내보자");
		writeName("이미자");
		writeName("손예진","한고은");
		writeName("캔디", "마이클", "캐서린", "이담스");
		writeName();
	}

}
