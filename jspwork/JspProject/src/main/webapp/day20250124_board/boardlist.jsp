<%@page import="simpleboard.data.SimpleAnswerDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="simpleboard.data.SimpleBoardDto"%>
<%@page import="java.util.List"%>
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
        
        .tabboard thead th{
           background-color: #add8e6;
           text-align: center;
        }
        
        .tabboard a{
           color: black;
           text-decoration: none;
           cursor: pointer;
        }
     </style>
</head>
<%
   //dao 선언
   SimpleBoardDao dao=new SimpleBoardDao();
   //전체 List 얻기
   List<SimpleBoardDto> list=dao.getAllDatas();
   //날짜 포멧 양식
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd.");
   //출력할 시작번호
   int no=list.size();
%>
<body>
<div style="margin: 30px;width:500px;">
   <h6><b>총 <%=list.size() %>개의 글이 있습니다</b>
   
   <button type="button" class="btn btn-sm btn-outline-success"
   style="float: right;"
   onclick="location.href='./boardform.jsp'">
   <i class="bi bi-pencil-fill"></i>글쓰기</button>
   </h6>
   <table class="table table-bordered tabboard">
      <thead>
         <tr>
            <th width="50">번호</th>
            <th width="220">제목</th>
            <th width="60">작성자</th>
            <th width="100">작성일</th>
            <th>조회</th>
         </tr>
      </thead>
      <tbody>
      <%
      if(list.size()==0)
      {%>
         <tr height="50" align="center">
            <td colspan="5">
               <b>등록된 게시글이 없습니다</b>               
            </td>
         </tr>
      <%}else{
         for(SimpleBoardDto dto:list)
         {%>
            <tr align="center">
               <td><%=no--%></td>
               <td align="left">
                 <!-- 제목이 너무 긴경우 200px 로 자르기,뒤에 ... 으로 나옴 -->
                 <div style="text-overflow: ellipsis;overflow: hidden;
                 white-space: nowrap;display: block;max-width: 200px;">
                  <a href="./contentdetail.jsp?num=<%=dto.getNum()%>">
                  <%=dto.getSubject() %>
                  <%
                  SimpleAnswerDao adao = new SimpleAnswerDao();
                  int acount = adao.getAnswerByNum(dto.getNum()).size();
                  
                  if(acount>0){
                  %>
                  &nbsp;
                  <span style="color:red;">(<%=acount %>)</span>
                  <%} %>
                  </a>
                </div>
               </td>
               <td><%=dto.getWriter() %></td>
               <td><%=sdf.format(dto.getWriteday()) %></td>
               <td><%=dto.getReadcount() %></td>
            </tr>
         <%}
      }
      %>
      </tbody>
   </table>
</div>
</body>
</html>
