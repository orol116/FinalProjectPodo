// 댓글 등록

const reply2 = document.getElementById("reply2");


if(reply2 != null){

    reply2.addEventListener("click", function(){ // 댓글 등록 버튼이 클릭이 되었을 때
        
        selectReplyList();
    })
}   

function selectReplyList(){
    
    const replyContent = document.getElementById("reply-content").value;
    console.log(replyContent);

    $.ajax({
        url : contextPath + "/admin/reply",
        data : {"boardContent" : replyContent,
                "boardNo": boardNo }, // boardContent
        type : "post",
        dataType : "JSON", 
        success : function(result){
            //nList : 반환 받은 알림 목록

            rList =  result[0];
            
            //발신자
            const chat = document.getElementById('chat');
            chat.innerHTML='';
            
            const reply = document.createElement("div");
            reply.setAttribute("id","reply");
            chat.append(reply);

            const information = document.createElement('div');
            information.classList.add("information");

            const feedback = document.createElement('div');
            feedback.classList.add("feedback");
            
            reply.append(information, feedback);
                                
            const p1 = document.createElement("p");
            p1.innerHTML="&#127815;&nbsp;관리자";

            const p2 = document.createElement("p");
            p2.classList.add("reply-date");
            p2.innerHTML =  "(" + rList.createDate + ")";
            information.append(p1,p2);

            const noteContent = document.createElement("p");
            noteContent.innerHTML = rList.replyContent;    
            
            feedback.append(noteContent);

            const alramMessage ={
                "memberNo" :memberNo ,
                "memberId": memberId,
                "boardName":"inquireReply",
                "alarmContent":replyContent,
                "boardNo":boardNo,
                "recieveMemberNo": recieveMemberNo,
                // "boardLink":boardLink
            };

            console.log(alramMessage);
            socket.send(JSON.stringify(alramMessage));

        },
        error : function(req,status,error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}
   

// 댓글 삭제
function deleteReply(){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        $.ajax({
            url : contextPath + "/admin/reply/delete",
            data : {"boardNo" : boardNo},
            type : "GET",
            success: function(result){

                if(result > 0){
                    alert("삭제되었습니다");
                    location.href= contextPath+'/member/inquireList/detail/'+boardNo
                }else{
                    alert("삭제 실패");
                }
            },

            error : function(req, status, error){
                console.log("댓글 삭제 실패")
                console.log(req.responseText);
            }

        });
    }
}