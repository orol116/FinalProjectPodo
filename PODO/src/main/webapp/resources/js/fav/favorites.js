// 찜 등록 버튼 기능
$(".add-fav-btn").click(function(){
    // 찜 테이블에 고유 번호 컬럼 필요
    // 담긴 갯수를 카운트할 컬럼 필요


    var boardNo = $(".boardNo").val();
    var favStock = $(".favNum").val();
        
    var data = {
        boardNo : boardNo,
        favStock : favStock
        };

    $.ajax({
        url : "/member/addFav",
        type : "post",
        data : data,
        success : function(result){
        alert("찜 목록 성공");
        $(".numBox").val("1");
        },
        error : function(){
        alert("카트 담기 실패");
        }
    });
});

$(".addCart_btn").click(function(){
    var gdsNum = $("#gdsNum").val();
    var cartStock = $(".numBox").val();
             
    var data = {
      gdsNum : gdsNum,
      cartStock : cartStock
      };
    
    $.ajax({
     url : "/shop/view/addCart",
     type : "post",
     data : data,
     success : function(result){
      
      if(result == 1) {
       alert("카트 담기 성공");
       $(".numBox").val("1");
      } else {
       alert("회원만 사용할 수 있습니다.")
       $(".numBox").val("1");
      }
     },
     error : function(){
      alert("카트 담기 실패");
     }
    });
   });