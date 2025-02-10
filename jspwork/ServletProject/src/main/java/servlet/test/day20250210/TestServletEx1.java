package servlet.test.day20250210;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServletEx1
 */
// @WebServlet("/TestServletEx1") //패키지랑 관련없는 ""로 적어도 됨
@WebServlet("/bit/hello") //url에는 /bit/hello가 나오지만 실제 출력은 result1.jsp가 됨
public class TestServletEx1 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//request에 각종 데이터 저장하기
		request.setAttribute("today",  new Date());
		request.setAttribute("myname",  "이영자");
		request.setAttribute("myage",  18);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		request.setAttribute("today2", sdf.format(new Date()));
		
		//jsp 파일로 포워드 (jsp -> jsp : jsp:forward)
		//포워드의 장점 : 주소가 안바뀜 (저장된 데이터를 보낼 땐 주로 forward로 사용). request가 그대로 전달. url 주소 안바뀜
		RequestDispatcher rd = request.getRequestDispatcher("../jstltest/result1.jsp");//상대주소 -> url 기준으로 상대주소임
		rd.forward(request,  response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
