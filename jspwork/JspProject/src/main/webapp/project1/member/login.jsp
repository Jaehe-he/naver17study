<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: 'Jua';
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        .form-label {
            font-weight: bold;
        }
        .login-title {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-title">로그인</h2>
        <%
            String idsave = (String) session.getAttribute("idsave");
            String id = (String) session.getAttribute("id");
            if (idsave == null) id = "";
        %>
        <form action="loginaction.jsp" method="post" id="login" name="lo">
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input type="text" name="id" id="id" class="form-control" required="required" value="<%= id %>">
            </div>
            <div class="mb-3">
                <label for="pw" class="form-label">비밀번호</label>
                <input type="password" name="pw" id="pw" class="form-control" required="required">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" name="idsave" id="idsave" class="form-check-input" <%= idsave == null ? "" : "checked" %>>
                <label class="form-check-label" for="idsave">아이디 저장</label>
            </div>
            <button type="submit" class="btn btn-primary w-100">로그인</button>
        </form>
    </div>
</body>
</html>
