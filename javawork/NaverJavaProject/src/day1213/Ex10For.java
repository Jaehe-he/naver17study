package day1213;

public class Ex10For {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i = 1; i <= 5 ; i++) //3번째(i++)값은 증간연산자(++, --)나 대입연산자(+=,-= 등)만 올 수 있다.
			System.out.print(i+ " "); //결과 : 1 2 3 4 5
		System.out.println();
		
		for(int i = 1; i <= 10; i+=2) //2씩 증가
			System.out.print(i+" ");
		System.out.println();
		
		for (int i = 10; i >= 1; i --)
			System.out.print(i + " ");
		System.out.println();
		
		for (int i = 10; i <= 100; i+=10)
			System.out.print(i + " ");
		System.out.println();
		
		System.out.println("break");
		for(int i = 1; i <=10; i++ ) {
			System.out.print(i+" ");
			if(i==5)
				break;
		}
		
		System.out.println();
		System.out.println("continue");
		for(int i = 0; i<= 10; i++) {
			if(i%2==1)
				continue;
			System.out.print(i + " "); //짝수만 호출
		}
	}

}