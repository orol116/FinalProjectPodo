// 찜 등록 버튼 기능
document.getElementById("do-bookmark").addEventListener("click", function(){

    console.log(boardNo);
    console.log(loginMemberNo);

    $.ajax({
        url : contextPath + "/board/addFav",
        data : {"loginMemberNo" : loginMemberNo
              , "boardNo" : boardNo},
        type : "GET",
        success : function(result){
        
            if(result > 0) {
                alert("찜 상품 담기 성공");
            } else {
                alert("회원만 사용할 수 있습니다.");
            }
        },
        error : function(){
            alert("찜 등록 실패");
        }
    });
});



// 찜 삭제
function deleteOne(boardNo){
    if(confirm("찜 목록에서 삭제 하시겠습니까?")){
        $.ajax({
            url : contextPath + "/member/myPage/favDel",
            data : {"boardNo" : boardNo,
                    "memberNo" : loginMemberNo},
            type : "GET",

            success: function(result){
                if(result > 0){
                    alert("삭제되었습니다");
                    location.reload();
                }else{
                    alert("삭제 실패");
                }
            },
            error : function(req, status, error){
                console.log("찜 삭제 삭제 실패");
            }
        });
    }
}


