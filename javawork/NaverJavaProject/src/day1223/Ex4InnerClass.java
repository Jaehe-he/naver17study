package day1223;

abstract class AbstSawon
{
	abstract public void addSawon();
	abstract public void removeSawon();
}
////////////////////////////////////
interface InterSales
{
	public void insertSangpum();
	public void selectSangpum();
}
////////////////////////////////////
//위의 클래스와 인터페이스를 익명 내부 클래스 형태로 구현후
//메인에서 호출하시오
public class Ex4InnerClass {
	AbstSawon sawon=new AbstSawon() {
		
		@Override
		public void removeSawon() {
			// TODO Auto-generated method stub
			System.out.println("사원을 목록에서 제거합니다");
		}
		
		@Override
		public void addSawon() {
			// TODO Auto-generated method stub
			System.out.println("사원을 목록에 추가합니다");
		}
	};
	
	InterSales sales=new InterSales() {
		
		@Override
		public void selectSangpum() {
			// TODO Auto-generated method stub
			System.out.println("상품을 선택합니다");
		}
		
		@Override
		public void insertSangpum() {
			// TODO Auto-generated method stub
			System.out.println("상품을 추가합니다");
		}
	};
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex4InnerClass ex4=new Ex4InnerClass();
		ex4.sawon.addSawon();
		ex4.sawon.removeSawon();
		System.out.println();
		ex4.sales.insertSangpum();
		ex4.sales.selectSangpum();
	}

}












