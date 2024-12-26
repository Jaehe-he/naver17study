package day1223;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
  
class MyFrame extends JFrame
{
	//멤버변수로 버튼을 생성
	JButton btn1=new JButton("OneButton");
	
	public MyFrame() {
		// TODO Auto-generated constructor stub
		//super();//생략가능
		super("Hello");//창제목 지정
		
		this.setBounds(300, 100, 300, 300);//x,y,width,height
		//기본 레이아웃 없애기
		this.setLayout(null);
		//버튼 위치 지정
		btn1.setBounds(30, 30, 100, 30);
		//프레임에 추가
		this.add(btn1);
		
		//버튼 이벤트-익명 내부 클래스 형태
		btn1.addActionListener(new ActionListener() {
			
			private Component MyFrame;

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				JOptionPane.showMessageDialog(this.MyFrame,"버튼이벤트입니다");
			}
		});
		
		this.setVisible(true);//프레임이 보인다
		
		//아래 메서드가 없을경우 x 를 눌러서 프레임을 닫으면 그냥 프레임 숨김만 된다
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//실제 프로그램 종료
	}
}
public class Ex6JFrame {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyFrame my=new MyFrame();
	}

}
