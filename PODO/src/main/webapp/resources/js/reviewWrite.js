// 리뷰 작성 유효성 검사
function reviewValidate(){
    const reviewTitle = document.getElementsByName("reviewTitle")[0];
    const reviewContent = document.querySelector("[name='reviewContent']");

    if(reviewTitle.value.trim().length == 0){
        alert("제목을 입력해주세요!!!");
        reviewTitle.value = "";
        reviewTitle.focus();
        return false;
    }

    if(reviewContent.value.trim().length == 0){
        alert("내용을 입력해주세요!!!");
        reviewContent.value = "";
        reviewContent.focus();
        return false;
    }

    return true;
}


// 추천, 비추천
function updateLike(){ 
    $.ajax({
        type : "POST",  
        url : contextPath + "/member/updateLike",       
        dataType : "JSON",   
        data : {"memberNo" : loginMemberNo,
                "memberGrape" : memberGrape},
        success : function(likeCheck) {
            
                if(likeCheck == 0){
                    alert("추천완료");
                    location.reload();
                }
                else if (likeCheck == 1){
                    alert("추천취소");
                    location.reload();
            }
        },
        error : function(){
            console.log("추천 기능 수행 중 오류 발생");
        }
    });
}