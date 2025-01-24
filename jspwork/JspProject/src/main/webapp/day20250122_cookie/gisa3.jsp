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
     </style>
</head>
<%
	boolean blogin=false;

	//현재 브라우저에 저장된 모든 쿠키값얻기, 없을경우 null 값
    Cookie []cookies=request.getCookies();
    if(cookies!=null)
    {
    	for(int i=0;i<cookies.length;i++)
    	{
    		//loginok 라는 쿠키가 있는지 검사
    		if(cookies[i].getName().equals("loginok")){
    			blogin=true;
    			break;
    		}
    	}
    }
%>
<body>
<%
	if(blogin){
	//로그인을 한상태
	%>
	<pre>
	아보카도는 식물성 단백질을 섭취하고자 하는 
	채식주의자들에게 특히 좋은 과일이다. 
	또한 아보카도는 다이어트 식품으로도 많이 이용된다. 
	아보카도에는 단백질과 섬유질을 비롯해 불포화 지방,
	 마그네슘, 비타민K 등 각종 영양소가 풍부하게 들어있다.

	아보카도의 적정 섭취량은 사람마다 다르지만 
	일반적으로 권장되는 1회 적정 섭취량은 아보카도 3분의 1개다. 
	멕시코가 원산지인 아보카도는 국내에서도 전남과 경남, 
	제주 지역에서 생산되지만 양이 많지 않아 대부분 외국에서 수입된다.
	</pre>	
	<%}else{%>
		<script type="text/javascript">
			alert("먼저 로그인을 해주세요");
			history.back();//이전 페이지로 이동			
		</script>
	<%}
%>

</body>
</html>