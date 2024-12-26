package day1223;
/*
 * jdk8 에서 인터페이스에 추가된 기능
 * 디폴트 인스턴스 메서드를 통해서 기능 구현이 가능하다
 */
interface RemoteControl
{
	//상수 선언
	int MAX_VOLUMN=10;
	int MIN_VOLUMN=0;
	
	//추상 메서드들
	public void turnOn();
	public void turnOff();
	public void setVolumn(int volumn);
	
	default void setMute(boolean mute)
	{
		if(mute) {
			System.out.println("무음 처리합니다");
			setVolumn(MIN_VOLUMN);
		}else {
			System.out.println("무음 해제합니다");
		}
	}
	
}

class Television implements RemoteControl
{
	int volumn;
	
	@Override
	public void turnOn() {
		// TODO Auto-generated method stub
		System.out.println("TV 를 켭니다");
	}

	@Override
	public void turnOff() {
		// TODO Auto-generated method stub
		System.out.println("TV 를 끕니다");
	}

	@Override
	public void setVolumn(int volumn) {
		// TODO Auto-generated method stub
		this.volumn=volumn;
		System.out.println("현재 볼륨은 "+this.volumn+" 입니다");
	}
	
}


public class Ex5DefaultInterface {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		RemoteControl rc1=null;//new 로 생성안됨
		//rc1.setMute(false);//널포인트이셉션이라는 오류 발생
		rc1=new Television();
		rc1.turnOn();
		rc1.turnOff();
		rc1.setMute(false);//인터페이스에서 구현된 메서드는 상속받은 클래스를 통해서만 호출이 가능하다
		rc1.setMute(true);
	}

}
















