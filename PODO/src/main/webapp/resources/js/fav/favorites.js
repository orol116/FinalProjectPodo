// 찜 등록 버튼 기능
const bookmark = document.getElementById("do-bookmark");
/* const bookmark = document.getElementsByClassName("do-bookmark"); */

/* if(bookmark != null){
    //document.getElementsByClassName("do-bookmark").addEventListener("click", function(){
    document.getElementById("do-bookmark").addEventListener("click", function(){
        console.log(boardNo);
        console.log(loginMemberNo);

        $.ajax({
            url : contextPath + "/board/addFav",
            data : {"loginMemberNo" : loginMemberNo
                , "boardNo" : boardNo},
            type : "GET",
            success : function(result){
            
                if(result == 1) {
                    // 입력이 된 경우
                    // 메세지 입력 시 필요한 데이터를 js객체로 생성
                    const alramMessage ={
                        "memberNo" :memberNo ,
                        "boardNo" :boardNo ,
                        "memberId": memberId,
                        "recieveMemberNo": receiveMemberNo,
                        "boardName":"favorites"
                        // "alarmContent":inputText.value,
                        // "boardLink":boardLink
                    };
                    console.log(alramMessage);
                    socket.send(JSON.stringify(alramMessage));

                    alert("찜 상품 담기 성공");
                } else if(result ==2){
                    
                    alert("찜 상품 취소 성공");
                }else {
                    alert("회원만 사용할 수 있습니다.");
                }
            },

            error : function(){
                alert("찜 등록 실패");
            }
        });
    });
} */

/* 찜등록 sweetAlert 적용 테스트 */
if(bookmark != null){
    //document.getElementsByClassName("do-bookmark").addEventListener("click", function(){
    document.getElementById("do-bookmark").addEventListener("click", function(){
        console.log(boardNo);
        console.log(loginMemberNo);

        $.ajax({
            url : contextPath + "/board/addFav",
            data : {"loginMemberNo" : loginMemberNo
                , "boardNo" : boardNo},
            type : "GET",
            success : function(result){
            
                if(result == 1) {
                    // 입력이 된 경우
                    // 메세지 입력 시 필요한 데이터를 js객체로 생성
                    const alramMessage ={
                        "memberNo" :memberNo ,
                        "boardNo" :boardNo ,
                        "memberId": memberId,
                        "recieveMemberNo": receiveMemberNo,
                        "boardName":"favorites"
                        // "alarmContent":inputText.value,
                        // "boardLink":boardLink
                    };
                    console.log(alramMessage);
                    socket.send(JSON.stringify(alramMessage));

                    /* alert("찜 상품 담기 성공"); */
                    Swal.fire('찜 상품 담기 성공')
                } else if(result ==2){
                    
                    /* alert("찜 상품 취소 성공"); */
                    Swal.fire('찜 상품 취소 성공')
                }else {
                    /* alert("회원만 사용할 수 있습니다."); */
                    Swal.fire('회원만 사용할 수 있습니다.')
                }
            },

            error : function(){
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '찜 등록에 실패 하였습니다',
                    footer: '<a href="">Why do I have this issue?</a>'
                  })
                /* alert("찜 등록 실패"); */
            }
        });
    });
}

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
                    /* alert("삭제되었습니다"); */
                    Swal.fire('삭제되었습니다.')
                    location.reload();
                }else{
                    /* alert("삭제 실패"); */
                    Swal.fire('찜 목록 삭제 요청에 실패하였습니다.')
                }
            },
            error : function(req, status, error){
                console.log("찜 삭제 삭제 실패");
                Swal.fire('찜 삭제 삭제 실패')
            }
        });
    }
}

