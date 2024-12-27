package day1227;

/*
 * 자바는 다중상속이 안되므로 부득이하게 이미 다른 클래스를
 * 상속받고 있다면 더 이상 Thread를 상속받을 수 없다.
 * 이런 경우는 인터페이스 Runnable을 구현함으로써 쓰레드를
 * 구현할 수 있다
 */

public class Ex5Runnable implements Runnable{
	int count;
	String msg;
	
	public Ex5Runnable(String msg, int count) {
		//TODO Auto-generated constructor stub
		this.msg=msg;
		this.count=count;
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		for(int i=1;i<=count;i++) {
			System.out.println(msg+":"+i);
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex5Runnable ex1=new Ex5Runnable("1번 쓰레드",300);
		Ex5Runnable ex2=new Ex5Runnable("2번 쓰레드",300);
		Ex5Runnable ex3=new Ex5Runnable("3번 쓰레드",300);

		//Runnable일 경우엔 쓰레드를 한번 더 생성해줘야함
		Thread th1 = new Thread(ex1);
		Thread th2 = new Thread(ex2);
		Thread th3 = new Thread(ex3);
		
		//run 메서드 호출
		th1.start();
		th2.start();
		th3.start();
	}

}
