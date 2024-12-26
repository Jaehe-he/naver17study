package day1223;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Ex13FileException {

	public static void scoreRead() throws FileNotFoundException,IOException
	{
		FileReader fr=null;
		BufferedReader br=null;
		
		fr=new FileReader("d:/naver1210/score.txt");
		System.out.println("파일을 찾았어요!!!!");
		
		br=new BufferedReader(fr);//한줄단위로 읽어오기 위해서
		
		int sum=0,n=0,score;
		while(true)
		{
			String line=br.readLine();
			if(line==null)
				break;
			try {
				score=Integer.parseInt(line);
				sum+=score;
				System.out.println(++n+"번 점수:"+score);
			}catch(NumberFormatException e)
			{
				System.out.println("문자가 있네요:"+e.getMessage());
			}
		}
		System.out.println("총 합계:"+sum);
		
		//열려진 자원들을 닫기-생성된 역순으로 닫기
		if(br!=null)
			br.close();
		if(fr!=null)
			fr.close();
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			scoreRead();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을수 없어요:"+e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("**정상 종료 **");
	}

}








