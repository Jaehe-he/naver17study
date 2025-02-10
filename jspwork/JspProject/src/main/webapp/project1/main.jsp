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
            font-family: 'Jua', sans-serif;
        }
        .container1 {
            padding: 35px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .container {
            padding: 5px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        
        .container2 {
            background-color: #ffffff;
            padding-left : 20px;
            padding-top : 15px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

        .text-center h3 {
            color: #2c3e50;
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .text-center h5 {
            color: #7f8c8d;
            font-size: 1.1rem;
        }

        .btn-category {
            background-color: #3498db;
            color: white;
            border: none;
            padding : 5px;
            margin-left : 1000px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            width: 150px;
        }

        .btn-category:hover {
            background-color: #2980b9;
        }

        .list1 {
    display: inline-block;
    text-align: center;
    margin-right: 5px;
    width: 18%; /* 부모 항목에 대한 비율로 설정 */
}

.list1 input {
    padding: 10px 20px;
    margin: 5px 10px;
    border: 1px solid #bdc3c7;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
}

.list2 {
    display: none; /* 하위 카테고리 숨기기 */
    text-align: center; /* 가운데 정렬 */
    margin-top: 10px; /* 하위 카테고리들 간격 설정 */
}

.list2 input {
    background-color: #f5f5f5;
    padding: 10px 20px;
    border: 1px solid #bdc3c7;
    border-radius: 5px;
    cursor: pointer;
    width: 150px;
    margin-left : 45px;
}

.list2 input:hover {
    background-color: #2980b9;
    color: white;
}
.list1 input:hover {
    background-color: #3498db;
    color: white;
}

.button-container {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    flex-wrap: wrap;
}

.list1 {
    width: 18%; /* 각 항목의 너비 */
}

.list2 {
	width : 30%;
}

        .liststyle i {
            font-size: 1.5rem;
            margin: 0 10px;
            cursor: pointer;
        }

        .liststyle i:hover {
            color: #3498db;
        }

        .result {
            margin-top: 20px;
            padding: 15px;
            background-color: #ecf0f1;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .grid-item {
            display: inline-block;
            width: 100%;
            padding: 10px;
            margin: 10px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .grid {
            display: flex;
            flex-wrap: wrap;
        }

.button-container {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    flex-wrap: wrap;
}

.list1, .list2 {
    width: 18%; /* 각 항목의 너비 */
}

    </style>
    <script>
    let view = "list";
    let selectedCategoryId = null;
        $(document).ready(function(){
        	list();
            $(".list2").hide(); // Hide subcategories initially
            $(".list1 > input").click(function(){
                $(this).next(".list2").slideToggle("fast");
            });

           
          //  $(function() {
            	
                $("div.liststyle i:eq(1)").css("color", "red");

                $("div.liststyle i").click(function() {
                    view = $(this).attr("view");
                    $(this).siblings().css("color", "black");
                    $(this).css("color", "red");
                    list();
                });
                
                $(".list1 input").click(function() {
                    selectedCategoryId = $(this).data("category-id"); // 카테고리 ID 가져오기
                    list();
                });
                
                // Category selection handling
                $(".list1 input").click(function() {
                    selectedCategoryId = $(this).data("category-id");
                    list();
                });
          });
             function list() {
            	 alert(selectedCategoryId);
             
                 $.ajax({
                     type: "get",
                     dataType: "json",
                     url: "./listposts.jsp", // listposts.jsp로 AJAX 요청
                     data: {categoryId: selectedCategoryId}, // 카테고리 ID를 파라미터로 전달
                     success: function(res) {
                         writedata(res);
                     }
                 });
             }

             function writedata(res) {
                 let s = "";

                 if (view == 'list') {
                     // Table view
                     s = `<table class="table table-bordered tab1">
                         <thead>
                            <th width="50">번호</th>
                            <th width="200">카테고리</th>
                            <th width="50">제목</th>
                            <th width="50">내용</th>
                            <th width="80">등록일</th>
                         </thead>
                         <tbody>
                         `;

                     $.each(res, function(idx, ele) {
                         s += `
                         <tr>
                             <td>${ele.id}</td>
                             <td>${ele.subcategory_id}</td>
                             <td>${ele.title}</td>
                             <td>${ele.content}</td>
                             <td>${ele.writeday}</td>
                         </tr>
                         `;
                     });
                     s += "</tbody></table>";
                 } else {
                     // Grid view
                     $.each(res, function(idx, ele) {
                         s += `
                         <div class="grid-item">
                             <p><strong>ID:</strong> ${ele.id}</p>
                             <p><strong>Category:</strong> ${ele.subcategory_id}</p>
                             <p><strong>Title:</strong> ${ele.title}</p>
                             <p><strong>Content:</strong> ${ele.content}</p>
                             <p><strong>Date:</strong> ${ele.writeday}</p>
                         </div>
                         `;
                     });
                 }

                 $("div.result").html(s);
             }


     
    </script>
</head>
<body>
<div class="container">
    <%@ include file="nav.jsp" %>
    <div class="text-center mb-5">
        <div class="container1" style="background-color:#F0F8FF;">
            <h3> 오늘 하루는 어떠셨나요? </h3>
            <h5> 행복한 하루 였나요? 아니면 조금 슬펐던 하루였나요? 어떤 하루였든 중요하지 않습니다. <br>
            행복했다면 그 기분을 쭉 가져가시고, 조금 슬펐다면 이 또한 지나가리라라고 생각하고 넘겼으면 좋겠습니다:)</h5>
        </div>
    </div>

    <div class="container2 input-group" style="background-color:#F0F8FF;">
        <h4> 카테고리 </h4>
        <form action="insertposts.jsp">
            <input type="submit" id="insertbtn" name="insertbtn" value="명언 등록" class="btn-category">
        </form>
    </div>

    <div class="container1 input-group button-container" style="background-color:#F0F8FF;">
        <!-- Category buttons -->
        <div class="list1">
            <input type="button" id="button1" name="button" value="인간관계" data-category-id="1">
            <div class="list2">
                <input type="button" id="button" name="button" value="사랑" data-category-id="2">
                <input type="button" id="button" name="button" value="친구" data-category-id="3">
                <input type="button" id="button" name="button" value="이별" data-category-id="4">
            </div>
        </div>

        <div class="list1">
            <input type="button" id="button2" name="button" value="삶" data-category-id="5">
            <div class="list2">
                <input type="button" id="button" name="button" value="인생" data-category-id="6">
                <input type="button" id="button" name="button" value="시간" data-category-id="7">
            </div>
        </div>

        <div class="list1">
            <input type="button" id="button3" name="button" value="성취" data-category-id="8">
            <div class="list2">
                <input type="button" id="button" name="button" value="성공" data-category-id="9">
                <input type="button" id="button" name="button" value="노력" data-category-id="10">
                <input type="button" id="button" name="button" value="도전" data-category-id="11">
            </div>
        </div>

        <div class="list1">
            <input type="button" id="button2" name="button" value="성장" data-category-id="12">
            <div class="list2">
                <input type="button" id="button" name="button" value="공부" data-category-id="13">
                <input type="button" id="button" name="button" value="자신감" data-category-id="14">
            </div>
        </div>

        <div class="list1">
            <input type="button" id="button2" name="button" value="용기" data-category-id="15">
            <div class="list2">
                <input type="button" id="button" name="button" value="희망" data-category-id="16">
                <input type="button" id="button" name="button" value="위로" data-category-id="17">
            </div>
        </div>
    </div>

    <div class="liststyle">
        <i class="bi bi-grid" view="grid"></i>
        <i class="bi bi-card-list" view="list"></i>
    </div>

    <div class="result">
        111
    </div>
</div>
</body>
</html>
