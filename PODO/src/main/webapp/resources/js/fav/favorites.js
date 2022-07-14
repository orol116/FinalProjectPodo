// 찜 등록 버튼 기능
$(".add-fav-btn").click(function(){
    // 찜 테이블에 고유 번호 컬럼 필요
    // 담긴 갯수를 카운트할 컬럼 필요
    var boardNo = $("#boardNo").val();
    var favStock = $(".numBox").val(); //.numBox?
                
    var data = {
            boardNo : boardNo,
            favStock : favStock
        };

    $.ajax({
        url : "/member/addFav",
        type : "post",
        data : data,
        success : function(result){
        
            if(result == 1) {
                alert("찜 상품 담기 성공");
                $(".numBox").val("1");
            } else {
                alert("회원만 사용할 수 있습니다.")
                $(".numBox").val("1");
            }
        },
        error : function(){
            alert("찜 등록 실패");
        }
    });
});

