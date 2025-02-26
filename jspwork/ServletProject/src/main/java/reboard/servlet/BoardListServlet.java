package reboard.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import reboard.data.BoardDao;
import reboard.data.BoardDto;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	BoardDao dao=new BoardDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이징 처리
		int perPage=10;//한페이지당 출력할 글의 갯수
		int perBlock=5; //한 블럭당 출력할 페이지 갯수
		int totalCount;//전체 게시글 갯수
		int totalPage; //총 페이지수
		int startNum;//각 페이지에서 가져올 시작번호(mysql은 첫데이타가 0번,오라클은 1번)
		int startPage;//각 블럭에서 출력할 시작페이지
		int endPage;//각 블럭에서 출력할 끝페이지
		int no;//각페이지에서 출력할 시작번호
		int pageNum;//현재 페이지 번호		
		List<BoardDto> list=null; //페이징에 필요한 데이타
		
		//현재 페이지를 얻는다(null 일경우 1페이지로)
		try {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}catch(NumberFormatException e) {
			pageNum=1;
		}		
		
		totalCount=dao.getTotalCount();//총 글갯수
		//totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);//총 페이지 갯수,나머지가 있으면 무조건 1페이지를 더한다
		totalPage=(int)Math.ceil((double)totalCount/perPage);//방법2,무조건 올림함수를 이용해서 구하는방법
		//시작페이지
		startPage=(pageNum-1)/perBlock*perBlock+1;//예:현재페이지가 7일경우 startPage 가 6(perBlock이5일경우)
		endPage=startPage+perBlock-1;//끝페이지
		//endPage 는 totalPage 를 넘을수 없다
		if(endPage>totalPage)
			endPage=totalPage;
		
		//각 페이지에서 불러올 시작번호
		startNum=(pageNum-1)*perPage; //mysql 은 첫글이 0번(오라클은 1번이므로 +1해야한다)		
		
		//System.out.println("totalPage="+totalPage);
		
		list=dao.getPagingList(startNum, perPage);
		//마지막 페이지의 1개남은 글을 지우고 다시 해당페이지를
		//왔을경우 데이타가 안나오는 현상 
		if(list.size()==0) {
			response.sendRedirect("./list?pageNum="+(pageNum-1));
		}
		
		//각페이지의 글앞에 출력할 시작번호(예:총글이 20개일경우 1페이지는 20,2페이이즌 15..)
		no=totalCount-(pageNum-1)*perPage;
		
		//request 에 저장
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("list", list);
		//페이지 출력에 필요한 모든 변수를 request 에 넣는다
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("no", no);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPage", totalPage);
			
		RequestDispatcher rd=request.getRequestDispatcher("./boardlist.jsp");
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