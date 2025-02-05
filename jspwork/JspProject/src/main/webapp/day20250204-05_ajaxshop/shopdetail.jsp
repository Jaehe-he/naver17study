<%@page import="java.text.SimpleDateFormat"%>
<%@page import="shop.data.ShopDto"%>
<%@page import="shop.data.ShopDao"%>
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
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   <style>
      body * {
         font-family: 'Jua';
      }
      .btn {
         width: 100px;
      }
   </style>
</head>
<%
   //1. num 읽기
   int num=Integer.parseInt(request.getParameter("num"));
   
   //2. dao 선언
   ShopDao dao = new ShopDao();
   
   //3. num 에 해당하는 dto 얻기 (dao 에 메서드 추가해야함 : getSangpum(int num))
   ShopDto dto=dao.getSangpum(num);
   
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<!-- 모달영역 -->
<!-- The Modal -->
<div class="modal" id="shopUpdateModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">상품수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      
    <!--이번에 수정은 폼단위로 값을 알아보자-->
   <form id=shopupdatefrm>
   <!-- hidden -->
   <input type="hidden" name="num" value="<%=num%>">
     <table class="table table-bordered">
     
     <!-- 이미지 영역 -->
      <tr>
         <td width="100" style="background-color: lightgray;">상품사진</td>
         <td>
            <select id="sphoto" name="sphoto" class="form-select">
               <script>
                  for(let i=1; i<=34; i++){
                     
                     let s="";
                     let sphoto=`../image/photo2/\${i}.\${i==24?"gif":"jpg"}`;
                     let dbphoto="<%=dto.getSphoto()%>";
                     
                     if(sphoto==dbphoto){
                        s=`<option value='\${sphoto}' selected>상품 \${i}</option>`;
                     }else{
                        s=`<option value='\${sphoto}'>상품 \${i}</option>`;
                     }
                     
                     document.write(s);
                  }   
               </script>
            </select>
            <br>
            <img src="" class="shopphoto" width="100">
            
            <script type="text/javascript">
               $(".shopphoto").attr("src",$("#sphoto").val());
               
               //이벤트
               $("#sphoto").change(function(){
                  $(".shopphoto").attr("src",$(this).val());
               });
            </script>
            
         </td>
      </tr>
      
      <tr>
         <td style="background-color: lightgray;">상품명</td>
         <td>
            <input type="text" name="sangpum" id="sangpum" class="form-control" value="<%=dto.getSangpum()%>">
         </td>
      </tr>
      <tr>
         <td style="background-color: lightgray;">상품색상</td>
         <td>
            <input type="color" name="scolor" id="scolor" value="<%=dto.getScolor()%>">
         </td>
      </tr>
      <tr>
         <td style="background-color: lightgray;">상품가격</td>
         <td>
            <input type="text" name="sprice" id="sprice" class="form-control" value="<%=dto.getSprice()%>">
         </td>
      </tr>
      <tr>
         <td style="background-color: lightgray;">상품갯수</td>
         <td>
            <input type="number" name="scnt" id="scnt" class="form-control" min="1" max="10" value="<%=dto.getScnt()%>">
         </td>
      </tr>
      <tr>
         <td style="background-color: lightgray;">입고일</td>
         <td>
            <input type="data" name="ipgoday" id="ipgoday" class="form-control" value="<%=dto.getIpgoday()%>">
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <button type="submit" data-bs-dismiss="modal" style="width: 120px;">수정하기</button>
         </td>
      </tr>
      </table>
         
   </form>
   </div>
   
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger"
        data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

   <!-- table 을 이용해서 상세페이지 만들기, 맨아래에 수정,삭제,목록 버튼 넣기 -->
   <div style="margin:20px; width: 500px;">
      <table class="table">
         <tr>
         <td>
            <img src="<%=dto.getSphoto()%>" width="230" height="300" border="1">
         </td>
         <td valign="middle">
            <h6>상품명 : <%=dto.getSangpum()%></h6>
            <h6>상품색상 : 
            <span style="background-color:<%=dto.getScolor() %>"><%=dto.getScolor()%></span></h6>
            <h6>수량 : <%=dto.getScnt()%></h6>
            <h6>가격 : <%=dto.getSprice()%>원</h6>
            <h6>입고일 : <%=dto.getIpgoday()%></h6>
            <h6>등록일 : <%=sdf.format(dto.getWriteday())%></h6>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <button type="button" class="btn btn-success btn-sm" id="btnupdate" data-bs-toggle="modal" 
            data-bs-target="#shopUpdateModal">수정</button>
            <button type="button" class="btn btn-success btn-sm" id="btndelete">삭제</button>
            <button type="button" class="btn btn-success btn-sm" onclick="location.href='./shopmain.html'">목록</button>
         </td>
         
      </tr>
      </table>
      <script type="text/javascript">
         $("#btndelete").click(function(){
            //confirm 으로 물어보고 [확인]을 누르면 삭제
            //ajax 함수를 이용해서 한다.
            //data로는 num을 보낸다.
            //success에서 목록으로 이동 (loaction.href)
            let a=confirm("삭제하겠습니까?");
            
            if(a){
               
               $.ajax({
                  
                  type:"get",
                  dataType:"html",
                  data:{"num":<%=num%>},
                  url:"./deleteshop.jsp",
                  success:function(){
                     alert("현재상품을 삭제했습니다.");
                     location.href="./shopmain.html";
                  }
               });
            }
         });
         /* 
         $("#btnupdate").click(function(){
            
            //수정 다이얼로그가 뜨면 데이타 수정후
            //현재 디테일 페이지 새로고침 (location.reload())
            
            
         }); */
         
         //모달 다이얼로그의 수정 submit버튼
         $("#shopupdatefrm").submit(function(e){
            //기본 이벤트 무효화
            e.preventDefault();
            //폼 단위 데이타 모두 얻기
            let d=$(this).serialize();
            //alert(d);
            $.ajax({
               type:"get",
               dataType:"html",
               data:d,
               url:"./updateshop.jsp",
               success:function(){
                  //수정 성공후
                  location.reload();
               }
               
            });
         });
      </script>
      

      
   </div>
</body>
</html>