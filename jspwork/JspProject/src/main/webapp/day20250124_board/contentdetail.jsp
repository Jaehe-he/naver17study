<%@page import="simpleboard.data.SimpleAnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="simpleboard.data.SimpleAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="simpleboard.data.SimpleBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>502 jsp study</title>
	<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body *{
            font-family: 'Jua';
        }
        
        .btn{
        	 width: 90px;
        }
        
        .day{
        	color: #ccc;
        	font-size: 0.8em;
        	float: right;
        }
        
        .answerlist{
        	margin-bottom: 10px;
        	margin-left: 10px;
        }
        
        .answerdel{
        	color:gray;
        	margin-left: 5px;
        	cursor: pointer;
        }
     </style>
</head>
<%
	//1. num 읽기
	int num=Integer.parseInt(request.getParameter("num"));

	//2. dao 선언
	SimpleBoardDao dao=new SimpleBoardDao();
	
	//3. 조회수 증가 메서드 호출
	dao.updateReadCount(num);
	
	//4. num 에 해당하는 dto 얻기
	SimpleBoardDto dto=dao.getData(num);
	
	//5. 날짜 양식(yyyy.MM.dd HH:mm)
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd. HH:mm");
	
	//6.adao 선언
	SimpleAnswerDao adao=new SimpleAnswerDao();
	
	//7.num 에 해당하는 alist 가져오기
	List<SimpleAnswerDto> alist=adao.getAnswerByNum(num);
%>
<body>
<div style="margin: 20px;width:500px;">
	<table class="table">
		<caption align="top">
			<h2><b><%=dto.getSubject() %></b></h2>
		</caption>
		<tr>
			<td>
				<b>작성자:<%=dto.getWriter()%></b>
				<span class="day"><%=sdf.format(dto.getWriteday()) %></span>
			</td>
		</tr>
		<tr>
			<td>
				<span>조회 <%=dto.getReadcount() %></span>
				<br><br>
				<!-- 줄넘김 방법 1 -->
				<%-- <div>
				<%=dto.getContent().replace("\n", "<br>") %>
				</div> --%>
				
				<!-- 줄넘김 방법 2 -->
				<pre><%=dto.getContent() %></pre>
				<br>
				<br>
				<!-- 댓글 갯수 출력 부분 -->
				<span style="margin-left: 10px;">
					<i class="bi bi-chat-dots"></i>&nbsp;<%=alist.size() %>
			</td>
		</tr>
		<tr>
			<td>
			<!-- 댓글 목록 출력 부분 -->
				<div class="answerlist">
				 <%
				 for(SimpleAnswerDto adto:alist)
				 {%>
					[<%=adto.getNickname()%>]&nbsp;
					<%=adto.getContent()%> &nbsp;&nbsp;
					<i class="bi bi-trash answerdel" idx="<%=adto.getIdx()%>"></i>
					<span class="day">
						<%=sdf.format(adto.getWriteday()) %>
					</span>
					<br>
				 <%}
				 %>
				 <!-- 댓글 삭제 이벤트 -->
				 <script type="text/javascript">
				 	$(".answerdel").click(function(){
				 		let ans=confirm("현재 댓글을 삭제할까요?");
				 		//태그안의 idx 값 얻기
				 		let idx=$(this).attr("idx");
				 		let num=<%=num%>;
				 		//삭제페이지로 이동
				 		//idx?삭제에 필요함,num?삭제후 상세페이지로 오기위해서 필요함
				 		location.href="./answerdelete.jsp?idx="+idx+"&num="+num;
				 		
				 	});
				 </script>
				</span>
				<!-- 댓글 목록 출력 -->
				</div>
				
				<form action="./answeraction.jsp" method="post">
					<input type="hidden" name="num" value="<%=num%>">
					<div class="input-group">
						<input type="text" class="form-control"
						name="nickname" style="width: 120px;"
						placeholder="닉네임" required="required">
						&nbsp;&nbsp;
						<input type="text" class="form-control"
						name="content" style="width: 250px;"
						placeholder="댓글내용" required="required">
						&nbsp;&nbsp;
						<button type="submit" class="btn btn-sm btn-info">등록</button>
					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td align="center">
				<button type="button" class="btn btn-sm btn-outline-success"
				onclick="location.href='./boardform.jsp'">글쓰기</button>
				
				<button type="button" class="btn btn-sm btn-outline-success"
				onclick="location.href='./boardlist.jsp'">목록</button>
				
				<button type="button" class="btn btn-sm btn-outline-success"
				onclick="location.href='./updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
				
				<button type="button" class="btn btn-sm btn-outline-success"
				onclick="delfun(<%=dto.getNum()%>)">삭제</button>
				
				<script type="text/javascript">
					function delfun(num) {
						let ans=confirm("해당 게시글을 삭제합니다");
						if(ans){
							location.href="./boarddelete.jsp?num="+num;
						}
					}
				</script>
			</td>
		</tr>
	</table>
</div>
</body>
</html>