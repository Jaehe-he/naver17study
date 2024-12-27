package day1227;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;

public class Ex9SocketClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String ip = "192.168.0.26"; //강사pc ip
		Socket socket = null;
		try {
			socket = new Socket(ip, 6000);
			System.out.println("서버에 접속 성공");
		} catch (IOException e) {
			System.out.println("서버에 접속 실패 : " +e.getMessage());
		}

	}

}
