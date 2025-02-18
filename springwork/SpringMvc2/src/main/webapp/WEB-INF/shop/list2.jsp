<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
 <h4 class="alert alert-danger">폼2로부터 읽은 상품 정보</h4>
 <%-- <h5>상품명 : ${shopDto.sang }</h5>
 <h5>수량 : ${shopDto.su }</h5>
 <h5>단가 : ${shopDto.dan }</h5>
 <img  src="./image/${shopDto.photo }"> --%>
 
 <h5>상품명 : ${dto.sang }</h5>
 <h5>수량 : ${dto.su }</h5>
 <h5>단가 : ${dto.dan }</h5>
 <img  src="./image/${dto.photo }">
</body>
</html>