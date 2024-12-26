package day1223;

import java.util.Date;

public class Ex7Exception {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int []arr= {4,5,7,12};
		for(int i=0;i<=arr.length;i++)
		{
			try {
				System.out.println(arr[i]);
			//}catch(ArrayIndexOutOfBoundsException e)
			}catch(Exception e)//상위 이셉션으로 처리
			{
				System.out.println("오류메세지 : "+e.getMessage());
				e.printStackTrace();//오류추적을 해서 행번호도 표시
			}
		}
		
		System.out.println();
		Date date=null;
		try {
			int age=(date.getYear()+1900)-1989;
			System.out.println("age="+age);
		}catch (NullPointerException e) {
			System.out.println("오류메세지:"+e.getMessage());
		}
			
		System.out.println("정상종료");
	}

}









