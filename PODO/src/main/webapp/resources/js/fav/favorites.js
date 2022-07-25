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
function selectAll(selectAll)  {
  const selects = document.getElementsByName('select');
  
    selects.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
} 
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

// 전체 선택 삭제
var deleteAll = document.querySelector(".deleteAll");

deleteAll.onclick = () => {
    for(var i=0; i<list.length; i++){
        if(list[i].checked){
            list[i].parentElement.parentElement.remove();
        }
    }
}


/* 찜 목록 조회 */
/* function favorBoardList(){

    $.ajax({
        url : contextPath + "/board/favorBoardList",
        data : {"boardNo" : boardNo},
        type : "GET",
        datatype : "JSON",
        success : function(favBoard){

            console.log(favBoard);

            console.log(data.boardImageList[0].imageReName);

			var img = document.getElementById("boardimg");
			img.src = contextPath + data.boardImageList[0].imageReName;

        },
        error : function(req, status, error){
            console.log("에러 발생");
        }
    });
    
} */

// 찜 삭제
function deleteOne(boardNo){
    if(confirm("찜 목록에서 삭제 하시겠습니까?")){
        $.ajax({
            url : contextPath + "board/delete",
            data : {"boardNo" : boardNo},
            type : "GET",
            success: function(result){
                if(result > 0){
                    alert("삭제되었습니다");
                    favBoard(); // 목록을 다시 조회해서 삭제된 글을 제거
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


// 리스트 데이터 바인딩
var favBoard = document.getElementById("favBoard");

// 가나다순
$("#sortAbc").click(function(){
    let sortAbc = favBoard.slice();
    sortAbc.sort(function(item1, item2){
        if(item1.title < item2.title) return -1;
        else if(item1.title == item2.title) return 0;
        else return 1;
    });
})


// 가격순
$("#sortPrice").click(function(){
    let sortPrice = favBoard.slice();
    sortPrice.sort(function(item1, itme2){
        if(item1.price < item2.price) return -1;
        else if(item1.price == item2.price) return 0;
        else return 1;
    });
})

// 찜 많은 순
