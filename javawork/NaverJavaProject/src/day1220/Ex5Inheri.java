package day1220;

class Parent1
{
	public void process()
	{
		System.out.println("기본 작업을 한다");
	}
}
////////////////////////
class My1 extends Parent1
{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("벽지작업을 한다");
	}
}
///////////////////////////
class My2 extends Parent1
{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("바닥 작업을 한다");
	}
}

public class Ex5Inheri {

	public static void homeProcess(My1 my)
	{
		my.process();
	}
	
	public static void homeProcess2(My2 my)
	{
		my.process();
	}
	
	public static void homeProcessAll(Parent1 p)
	{
		p.process();//p 안에 누가 생성되어있는냐에 따라서 서로 다른일을 처리한다
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		My1 my1=new My1();
//		my1.process();
//		
		My2 my2=new My2();
//		my2.process();
		
		homeProcess(my1);
		homeProcess2(my2);
		System.out.println("=".repeat(20));
		//다형성처리
		Parent1 p1=null;
		p1=new My1();
		p1.process();//My1이 가진 process 메서드가 호출
		
		p1=new My2();
		p1.process();//My2이 가진 process 메서드가 호출
		System.out.println("=".repeat(20));
		
		homeProcessAll(new My1());
		homeProcessAll(new My2());
		homeProcessAll(new Parent1());
	}

}











