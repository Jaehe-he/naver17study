<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Gaegu&family=Jua&family=Nanum+Pen+Script&family=Playwrite+AU+SA:wght@100..400&family=Single+Day&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: 'Jua';
        }
        .join-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }
        .form-label {
            font-weight: bold;
        }
        .join-title {
            text-align: center;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
    <div class="join-container">
        <h2 class="join-title">회원가입</h2>
        <form action="joinaction.jsp" method="post" id="join" name="fr">
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <div class="input-group">
                    <input type="text" name="id" id="id" class="form-control" required="required">
                    <button type="button" class="btn btn-outline-secondary" id="btn">아이디 중복 확인</button>
                </div>
            </div>
            <div class="mb-3">
                <label for="pw" class="form-label">비밀번호</label>
                <input type="password" name="pw" id="pw" class="form-control" required="required">
            </div>
            <div class="mb-3">
                <label for="pwcheck" class="form-label">비밀번호 재확인</label>
                <input type="password" name="pwcheck" id="pwcheck" class="form-control" required="required">
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" name="name" id="name" class="form-control" required="required">
            </div>
            <div class="mb-3">
                <label class="form-label">전화번호</label>
                <div class="input-group">
                    <select name="phone1" class="form-select">
                        <option selected>010</option>
                        <option>02</option>
                        <option>031</option>
                        <option>051</option>
                    </select>
                    <span>-</span>
                    <input type="text" name="phone2" size="5" class="form-control" required="required">
                    <span>-</span>
                    <input type="text" name="phone3" size="5" class="form-control" required="required">
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">성별</label>
                <div>
                    <input type="radio" name="gender" value="m" checked> 남자
                    <input type="radio" name="gender" value="f"> 여자
                </div>
            </div>
            <button type="submit" class="btn btn-primary w-100">가입하기</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
