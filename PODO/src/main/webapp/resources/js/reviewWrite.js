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