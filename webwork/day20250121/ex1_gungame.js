$(function(){
    /*
    총을 클릭 시 0~11 사이의 난수 발생 후 해당번째의 인형을
    사라지게 하기
    이미 사라진 경우는 메시지 출력
    */
   $(".gun").click(function(){
    //0~11사이 난수 발생
    let idx=parseInt(Math.random()*12);

    if ($(".sunban img").eq(idx).is(":hidden")){
        $("#msg").html("꽝!!!"+(idx+1)+"번째 인형은 없습니다");
    }else{
        $("#msg").html((idx+1)+"번째 인형을 맞췄습니다.");
        // $(".sunban img").eq(idx).fadeOut('fast'); //fadeOut : 마지막 하나를 맞추기 전에 if문이 실행됨
        $(".sunban img").eq(idx).hide(); //12개 다 반영되기 위해 hide()로 해줌
    }

    //hidden 갯수가 12이면 게임 끝
    let n=$(".sunban img:hidden").length;
    if(n==12){
        $("#msg").html("Game Over!!!");
    }
   });

   //돈을 클릭 시 돈은 사라지고 나머지는 모두 초기화
   $(".money img").click(function(){
    $(".sunban img").show(); //선반 위에 인형 다시 보이도록
    $("#msg").html(""); //msg에 있는것들 모두 지우기

    // $(this).css("visibility", "hidden"); //visibility : 자리차지
    $(this).css("display","none"); //display : 자리 차지 않음
   });
});