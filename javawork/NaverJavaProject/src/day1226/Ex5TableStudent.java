package day1226;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;

public class Ex5TableStudent extends JFrame {
	static final String FILENAME="c:/naver1210/student.txt";
	JTable table;
	List<Student> list = new ArrayList<Student>();
	
	public Ex5TableStudent() {
		super("학생성적관리");
		this.setBounds(300, 100, 400, 300);
		this.initDesign();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}

	
	public void initDesign() {
		this.studentFileRead(); //파일을 읽어서 list 변수에 담는다
		//list의 데이터를 읽어서 테이블에 출력 후
		//프레임에 출력하시오
		//제목은 이름, 국어, 영어, 총점, 평균
		
		String []title = {"이름" , "국어", "영어", "총점", "평균"};
		
		String [][]data = new String[list.size()][5];
		
		int i=0;
		for(Student s: list) {
			data[i][0] = s.getName();
			data[i][1] = String.valueOf(s.getKor());
			data[i][2] = String.valueOf(s.getEng());
			//내가 한 방법
			data[i][3] = String.valueOf(s.getSum());
			data[i][4] = String.valueOf(s.getAvg());
			
//			//강사님께서 한 방법 (나는 Student.java에 48,49행 추가해줌
//			int sum=s.getKor()+s.getEng();
//			double avg=sum/2.0;
//			data[i][3] = String.valueOf(sum);
//			data[i][4] = String.valueOf(avg);
			
			i++;
		}
		
		table = new JTable(data, title);
		this.add("Center", new JScrollPane(table));
		
	}
	
	public void studentFileRead() {
		//파일을 읽어서 list 변수에 담기
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader(FILENAME);
			br = new BufferedReader(fr);
			
			while(true) {
				String studentInfo = br.readLine();
				if(studentInfo ==null)
					break;
				
				String []s = studentInfo.split("\\|");
				Student student = new Student();
				student.setName(s[0]);
				student.setKor(Integer.parseInt(s[1]));
				student.setEng(Integer.parseInt(s[2]));
				student.setSum(Integer.parseInt(s[3]));
				student.setAvg(Double.parseDouble(s[4]));
				
				list.add(student);
			}
			System.out.println("총 " + list.size() + "명 읽음");
		} catch(FileNotFoundException e) {
			System.out.println("저장된 정보가 없습니다.");
		}catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch(IOException|NullPointerException e) {
				
			}
		}
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Ex5TableStudent();
	}

}
