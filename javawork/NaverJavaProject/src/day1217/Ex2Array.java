package day1217;

public class Ex2Array {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char[] ch; //선언만 되었을 뿐 데이터를 넣을 수 있는 상태 X
		
		ch = new char[4]; //0~3번 인덱스까지 데이터를 넣을 수 있음
		
		System.out.println("배열 크기 : "+ch.length);
		
		//배열에 데이터 넣기
		ch[0] ='H';
		ch[1] = 65; //'A'
		ch[2] = 'x';
		ch[3] = 't';
		
		//출력 #1
		for(int i=0;i<ch.length;i++)
			System.out.println("ch["+i+"]="+ch[i]);
		System.out.println();
		//출력 #2
		for(char a:ch) //ch 배열 안에 있는만큼 a가 자동으로 뽑음
			System.out.println(a); //i값은 말고, 값만 얻을 수 있음
		
		//출력 #3
		System.out.println("=".repeat(30));
		char []ch2 = new char[5];
		ch2 = new char[] {'a', 'n', 'x', 'y', 'u'}; //앞에 선언문 + 데이터 한번에 주면 알아서 들어감
		for(int i=0;i<ch2.length;i++)
			System.out.println("ch2["+i+"]="+ch2[i]);
		
		System.out.println("=".repeat(30));
		char [] ch3= {'s','r','t','v','i'};
		for(char a:ch3)
			System.out.println(a);
	}

}
