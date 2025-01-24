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
	일주일 뒤면 이제 설날입니다.

	연초에 쉬고 가족들도 보고 참 좋은 명절이지만 설만 되면 
	어김없이 찾아오는 고민이 있습니다.
	
	이게 바로 세뱃돈, 얼마 줘야 할까인데 관련 조사가 있습니다.
	
	한 포털업체가 지난 4일부터 12일 성인남녀 3,795명을 
	대상으로 세뱃돈으로 얼마가 적당한지 물었는데요.
	
	AD
	
	응답자 38%가 5만 원을 적정선으로 꼽았습니다.
	
	이어 36%가 안 주고 안 받겠다고 답변하며 경제적 부담을 드러냈습니다.
	
	2023년 설문조사에서는 안 주고 안 받겠다는 응답이 29%였는데, 크게 늘어났습니다.
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