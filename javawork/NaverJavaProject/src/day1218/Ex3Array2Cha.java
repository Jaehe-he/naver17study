package day1218;

public class Ex3Array2Cha {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//2차원 배열은 행과 열로 할당(열갯수는 행마다 다를수 있다)
//		int [][]arr1 = new int[2][3]; //2행3열로 할당
		
		//각 행마다 열갯수를 다르게 할당을 해보자
		int [][]arr1 = new int[2][]; //일단 행갯수만 먼저 지정
		//각 행의 열갯수를 지정
		arr1[0] = new int[3];
		arr1[1] = new int[4];
		
		System.out.println("행갯수 : " + arr1.length);
		System.out.println("0번행의 열갯수: "+arr1[0].length);
		System.out.println("1번행의 열갯수 :  "+arr1[1].length);
		
		//2차원 배열에 값저장
		arr1[0][0] = 100;
		arr1[1][1] = 90;
		arr1[1][2] = 95;
		
		for(int i=0; i<arr1.length;i++) {
			for(int j=0; j<arr1[i].length;j++) {
				System.out.printf("%d,%d:%d\t", i,j,arr1[i][j]);
			}
			System.out.println();
		}
	}

}
