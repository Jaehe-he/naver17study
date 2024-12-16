package day1216;

public class Ex10Gugudan {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * 2단 3단 .... 9단 (한 페이지에 다 나올 수 있도록) (for문)
		 * repeat로 -----줄 그어주기
		 * 2*1=2 3*1=3 ....9*1=9
		 * .
		 * .
		 * .
		 * 2*9=18 3*9=27 ....9*9=81
		 */
		
		for(int dan=2;dan<=9;dan++) {
			System.out.print("["+dan+"단]\t");
		}
		System.out.println();
		System.out.print("=".repeat(65));
		for(int i=1;i<=9;i++) {
			System.out.println();
			for(int dan=2;dan<=9;dan++) {
				System.out.print(dan+"X"+i+"="+i*dan+"\t");
			}
		}
	}

}
