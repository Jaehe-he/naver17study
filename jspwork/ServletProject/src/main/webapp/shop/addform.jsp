<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> <!-- 이걸 import해야 c:를 사용 가능 -->
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 이걸 import해야 fmt:를 사용 가능 -->
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
	</style>
</head>
<body>
<div style="margin:20px; width:500px;">
	<form action="./insert" method="post">
		<table class="table table-bordered">
         <tr>
            <td width="100" style="background-color: lightgray;">상품사진</td>
            <td>
               <select id="sphoto" name="sphoto" class="form-select">
                    <script>
                       for(let i=1;i<=34;i++){
                          let s=`<option value='../image/photo2/\${i}.\${i==24?"gif":"jpg"}'>상품 \${i}</option>`;
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
               <input type="text" name="sangpum" id="sangpum"
            class="form-control">   
            </td>
         </tr>
         <tr>
            <td style="background-color: lightgray;">상품색상</td>
            <td>
               <input type="color" name="scolor" id="scolor"
                   value="#ffccff">
            </td>
         </tr>
         <tr>
            <td style="background-color: lightgray;">상품가격</td>
            <td>
               <input type="text" name="sprice" id="sprice" 
                 class="form-control">
            </td>
         </tr>
         <tr>
            <td style="background-color: lightgray;">상품갯수</td>
            <td>
               <input type="number" name="scnt" id="scnt" 
                 class="form-control" min="1" max="10" value="1">
            </td>
         </tr>
         <tr>
            <td style="background-color: lightgray;">입고일</td>
            <td>
               <input type="date" name="ipgoday" id="ipgoday" 
                 class="form-control" value="2025-01-01">
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <button type="submit"  data-bs-dismiss="modal"
               style=width:120px;"
               class="btn btn-sm btn-success">등록하기</button>
            </td>
         </tr>         
      </table>	
	</form>
</div>
</body>
</html>