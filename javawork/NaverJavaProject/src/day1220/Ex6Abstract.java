package day1220;
//추상클래스는 객체 생성을 할수없다
//자식 클래스로 하여금 반드시 구현하게 할 목적으로 추상메서드를 만든다
//만약 자식클래스가 추상메서드를 오버라이드안했을경우 그 클래스도 추상화시켜야한다
abstract class Parent2
{
	//부모가 process 에서 하는일이 없을경우
	//그렇다고 안만들면 자식클래스에서 오버라이드를 할수없다
	//이럴경우 미완성으로 선언만 하는데 이러경우 abstract 메서드로 만든다(미완성메서드란 의미)
	abstract public void process();//추상메서드는 일반 클래스에 멤버로 올수없다
	
	//추상클래스는 추상메서드뿐 아니라 일반메서드도 구현이 가능하다
	//부모만이 가진 메서드
	public void study() {
		System.out.println("자바 공부를 한다");
	}
}

class Your1 extends Parent2
{
	@Override
	public void process() {
		System.out.println("벽지공사를 합니다");
	}
	
	//Your1 이 가진 메서드
	public void draw()
	{
		System.out.println("그림을 그린다");
	}
}

class Your2 extends Parent2
{
	@Override
	public void process() {
		System.out.println("타일공사를 합니다");
	}
}
////////////////////////////////////////////
public class Ex6Abstract {

	public static void yourProcess(Parent2 p)
	{
		p.process();
		p.study();//부모가 가진 메소드는 호출 가능
		
		//p.draw();//오류 발생
		//p 에 Your2 가 생성되어있는경우에는 오류가발생
		((Your1)p).draw();//다운캐스팅후 호출하면 된다
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		yourProcess(new Your1());
		System.out.println("=".repeat(30));
		//yourProcess(new Your2());
		
		//yourProcess(new Parent2());//오류:추상클래스는 new 로 생성할수 없다
	}

}











