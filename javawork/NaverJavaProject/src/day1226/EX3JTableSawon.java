//Vector 이용해서 정보 출력
package day1226;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class EX3JTableSawon extends JFrame{

	JTable table;
	List<Sawon> sawonList = new Vector<Sawon>();
	static final String SAWONFILE = "c:/naver1210/mysawon.txt";
	
	public EX3JTableSawon() {
		super("사원파일 읽기");
		this.setBounds(300, 100, 300, 300);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		this.initDesign(); //컴포넌트들 추가
		this.setVisible(true);
	}
	
	private void initDesign() {
		// TODO Auto-generated method stub
		
		//파일정보 읽어오기
		this.sawonFileRead();
		//테이블의 제목부분
		Vector<String> title = new Vector<String>();
		title.add("사원명");
		title.add("나이");
		title.add("핸드폰");
		title.add("주소");
		
		//테이블의 데이터 부분
		Vector<Vector<String>> data = new Vector<Vector<String>>();
		
		for(Sawon s : sawonList) {
			Vector<String> sawon = new Vector<String>();
			sawon.add(s.getSawonName());
			sawon.add(String.valueOf(s.getAge()));
			sawon.add(s.getHp());
			sawon.add(s.getAddress());
			
			data.add(sawon);
		}
		
		//table 생성
		table = new JTable(data, title);
		//frame의 Center에 추가
		this.add("Center", new JScrollPane(table));
	}

	public void sawonFileRead() {
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader(SAWONFILE);
			br = new BufferedReader(fr);
			
			while(true) {
				String sawonInfo = br.readLine();
				if(sawonInfo ==null)
					break;
				
				String []s = sawonInfo.split("\\|"); //정규표현식 할 땐 ,(comma) 빼고 다 \\해줘야함
				Sawon sawon = new Sawon();
				sawon.setSawonName(s[0]);
				sawon.setAge(Integer.parseInt(s[1]));
				sawon.setHp(s[2]);
				sawon.setAddress(s[3]);
				
				//List에 추가
				sawonList.add(sawon);
			}
			System.out.println("총" + sawonList.size() +"명 읽음");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("저장된 사원정보가 없습니다.");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException|NullPointerException e) { //fr 처음에 호출하면 무조건 null이어서 NullPointerException 넣어줘야함
//				e.printStackTrace();
			}
		}
	}
		
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new EX3JTableSawon(); //생성자 호출
	}

}