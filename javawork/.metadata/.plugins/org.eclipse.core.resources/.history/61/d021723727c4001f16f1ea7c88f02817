package day1227;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class Ex7InetAddress {

	public static void main(String[] args) throws UnknownHostException {
		// TODO Auto-generated method stub
		//자기 컴퓨터의 IP와 컴퓨터 이름을 알아보자
		InetAddress local = InetAddress.getLocalHost();
		System.out.println("내 컴퓨터의 IP 주소 : " +local.getHostAddress());
		System.out.println("내 컴퓨터의 이름 : " + local.getHostName());
		
		System.out.println("=".repeat(30));
		
		System.out.println("Naver의 서버 컴퓨터의 IP");
		InetAddress []naverInet = InetAddress.getAllByName("www.naver.com");
		for(InetAddress inet:naverInet) {
			System.out.println("Naver IP : "+inet.getHostAddress());
			System.out.println("Naver 컴퓨터 이름 : " +inet.getHostName());
			System.out.println("-".repeat(30));
		}
		
		System.out.println("=".repeat(30));
		
		System.out.println("구글의 서버 컴퓨터의 IP");
		InetAddress []googleInet = InetAddress.getAllByName("www.google.com");
		for(InetAddress inet:googleInet) {
			System.out.println("Google IP : "+inet.getHostAddress());
			System.out.println("Google 컴퓨터 이름 : " +inet.getHostName());
			System.out.println("-".repeat(30));
		}
		
		System.out.println("=".repeat(30));
		
		System.out.println("네이트의 서버 컴퓨터의 IP");
		InetAddress []nateInet = InetAddress.getAllByName("www.nate.com");
		for(InetAddress inet:nateInet) {
			System.out.println("Nate IP : "+inet.getHostAddress());
			System.out.println("Nate 컴퓨터 이름 : " +inet.getHostName());
			System.out.println("-".repeat(30));
		}
	
	}

}
