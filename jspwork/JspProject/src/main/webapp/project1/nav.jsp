<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>502 JSP Study</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: 'Jua';
        }
        .navbar {
            background-color: #00008B;
            padding: 10px 20px;
        }
        .navbar-brand img {
            width: 300px;
            height: 100px;
        }
        .nav-item {
            display: flex;
            align-items: center;
            margin-left: 15px;
        }
        .nav-link {
            color: #fff;
            font-weight: bold;
        }
        .nav-link:hover {
            color: #ffdb58;
        }
        .user-info {
            color: #fff;
            font-size: 1.1em;
            margin-right: 15px;
        }
        .btn-outline-light {
            font-weight: bold;
            padding: 5px 15px;
        }
    </style>
</head>
<body>
    <nav class="navbar d-flex justify-content-between">
        <a class="navbar-brand" href="../project1/main.jsp">
            <img src="../image/project1/logo1.png" alt="Logo">
        </a>

        <div class="d-flex align-items-center">
            <%
                String id = (String) session.getAttribute("sId");
                if (id != null) {
            %>
                <span class="user-info"><%= id %>님</span>
                <form method="post" action="../project1/member/logoutaction.jsp">
                    <button class="btn btn-outline-light" type="submit">로그아웃</button>
                </form>
            <%
                } else {
            %>
                <form method="get" action="../project1/member/login.jsp">
                    <button class="btn btn-outline-light" type="submit">로그인</button>
                </form>
            <%
                }
            %>
            
            <form action="../project1/member/joinuser.jsp" style = "padding-left : 10px;">
			    <button class="btn btn-outline-light" type="submit">회원가입</button>
			</form>
        </div>
    </nav>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
