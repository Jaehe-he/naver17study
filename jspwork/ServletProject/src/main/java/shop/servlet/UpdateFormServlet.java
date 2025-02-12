package shop.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import shop.data.ShopDao;
import shop.data.ShopDto;

import java.io.IOException;

/**
 * Servlet implementation class UpdateFormServlet
 */
@WebServlet("/shop/updateform")
public class UpdateFormServlet extends HttpServlet {
	
	ShopDao dao = new ShopDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		//dto 읽기
		ShopDto dto = dao.getSangpum(num);
		
		//request에 dto 저장
		request.setAttribute("dto", dto);
		
		//updateform.jsp로 forward
		RequestDispatcher rd = request.getRequestDispatcher("./updateform.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
