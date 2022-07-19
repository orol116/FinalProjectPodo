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


// 전체 선택
/* function selectAll(selectAll)  {
  const selects 
       = document.getElementsByName('select');
  
    selects.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
} */
var selectAll = document.querySelector(".selectAll");
var list = document.querySelectorAll(".select");

selectAll.onclick = () => {
    if(selectAll.checked){
        for(var i=0; i<list.length; i++){
            list[i].checked = true;
        }
    }else{
        for(var i=0; i<list.length; i++){
            list[i].checked = false;
        }
    }
}


// 선택 삭제
var deleteAll = document.querySelector(".deleteAll");

deleteAll.onclick = () => {
    for(var i=0; i<list.length; i++){
        if(list[i].checked){
            list[i].parentElement.parentElement.remove();
        }
    }
}
