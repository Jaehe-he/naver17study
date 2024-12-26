package day1220;
class SuperObj2
{
	private String schoolName;
	
	public SuperObj2() {
		// TODO Auto-generated constructor stub
		schoolName="청담고등학교";
	}
	
	SuperObj2(String schoolName)
	{
		this.schoolName=schoolName;
	}
	
	public void write()
	{
		System.out.println("학교명 : "+schoolName);
	}
}

class SubObj2 extends SuperObj2
{
	private String studentName;
	
	public SubObj2() {
		// TODO Auto-generated constructor stub
		studentName="이름없음";
	}
	
	SubObj2(String schoolName,String studentName)
	{
		super(schoolName);
		this.studentName=studentName;
	}
	
	@Override  //부모의 메서드를 재정의 했다는 의미
	public void write() {
		// TODO Auto-generated method stub
		super.write();//부모가 처리한 로직 실행-호출 위치는 상관없음
		System.out.println("학생 이름 : "+studentName);
	}
}

class SubObj22 extends SuperObj2
{
	private String teacherName;
	
	public SubObj22() {
		// TODO Auto-generated constructor stub
		teacherName="이름없음";
	}
	
	SubObj22(String schoolName,String teacherName)
	{
		super(schoolName);
		this.teacherName=teacherName;
	}
	
	@Override
	public void write() {
		// TODO Auto-generated method stub
		System.out.println("선생님 이름: "+teacherName);
		super.write();
	}
}
///////////////////////////////////
public class Ex2Inheri {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SubObj2 s1=new SubObj2();
		SubObj2 s2=new SubObj2("강남고등학교", "홍길동");
		
		s1.write();
		System.out.println();
		s2.write();
		
		SubObj22 s3=new SubObj22();
		System.out.println();
		s3.write();
		
		SubObj22 s4=new SubObj22("중동고등학교", "이진");
		System.out.println();
		s4.write();
	}

}
















