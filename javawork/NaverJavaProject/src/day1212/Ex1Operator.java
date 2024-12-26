package day1212;

public class Ex1Operator {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//증감 연산자, ++변수 (전치:1순위) , 변수++(후치:끝순위)
		int a,b,m,n;
		a=b=5;
		m=++a;//먼저 a가 증가된후 m 으로 대입된다
		n=b++;//먼저 대입후 b가 증가된다
		System.out.printf("a=%d,b=%d,m=%d,n=%d\n",a,b,m,n);
		
		a=b=m=n=5;
		m=a++*++b;//5*6
		System.out.printf("a=%d,b=%d,m=%d,n=%d\n",a,b,m,n);
		
		n=a+++ ++b;//6+7
		System.out.printf("a=%d,b=%d,m=%d,n=%d\n",a,b,m,n);
		
		a=5;
		System.out.println(a++);//먼저 출력후 증가된다
		System.out.println(++a);//먼저 증가후 출력된다
		
		a=b=m=n=5;
		a*=b-- -++n*3;//5-6*3 => 5*-13
		System.out.printf("a=%d,b=%d,m=%d,n=%d\n",a,b,m,n);
	}

}
