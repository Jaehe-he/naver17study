package team;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class TeamArray {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		String []member= {
				"꽝","김녹엽","김동휘","김준호","박서희","박수진","백성현","서지훈",
				"오하늬","이원재","이재호","이재희","장진욱","전세호","전종원","조진용",
				"채원석","최원웅","최은영","최준혁"
		};
		String title;
		int teamInwon,teamCount;
		int []rnd=new int[20];
		String [][]team;
		System.out.println("팀의 제목을 입력하세요");
		title=sc.nextLine();
		System.out.println("한팀당 인원수를 입력하세요");
		teamInwon=sc.nextInt();//팀당인원수
		teamCount=20/teamInwon;//총 팀갯수
		
		//team 메모리 할당-행과열
		team=new String[teamCount][teamInwon];
		
		//rnd 에 0~19 의 중복되지 않은 숫자 할당
		for(int i=0;i<rnd.length;i++)
		{
			rnd[i]=(int)(Math.random()*20);
			for(int j=0;j<i;j++)
			{
				if(rnd[i]==rnd[j])
				{
					i--;
					break;
				}
			}
		}
		
		//오늘 날짜 출력
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd(EEE)");
		System.out.println("\t**"+title+"("+sdf.format(new Date())+")**");
		System.out.println();
		
		//team 에 rnd순서대로 이름 할당
		int idx=0;
		for(int i=0;i<team.length;i++)
		{
			for(int j=0;j<team[i].length;j++)
			{
				team[i][j]=member[rnd[idx++]];
			}
		}
		
		//출력
		for(int i=0;i<team.length;i++)
		{
			System.out.print("["+(i+1)+"조] : ");
			for(int j=0;j<team[i].length;j++)
			{
				try {
					Thread.sleep(200);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				System.out.print(team[i][j]+"  ");
			}
			System.out.println();
		}
		
	}

}









