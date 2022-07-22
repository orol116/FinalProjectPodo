// 댓글 등록
const reply2 = document.getElementById("reply2");
const replyContent = document.getElementById("reply-content");

reply2.addEventListener("click", function(){ // 댓글 등록 버튼이 클릭이 되었을 때


        function noteList(){
            
            $.ajax({
                url : contextPath + "/InquireDetail",
                data : {"boardContent" : boardContent }, // boardContent
                type : "GET",
                dataType : "JSON", 
                success : function(boardContent){
                    //nList : 반환 받은 알림 목록
                    console.log(boardContent);

                    if(boardContent != null){

                        //nList 에 저장된 요소를 하나씩
                        for(let bc of boardContent){
                            
                            //발신자
                            const reply = document.createElement("div");
                                                
                            reply.appendChild(div,information);
                            const p1 = document.createElement("p");
                            // p1.innerText = reply.memberNickname;
                            p1.innerHTML("&#127815;&nbsp;관리자");

                            const p2 = document.createElement("p");
                            p2.classList.add("reply-date");
                            p2.innerHTML =  "(" + reply.createDate + ")";

                            const noteContent = document.createElement("p");
                            noteContent.innerHTML = note.noteContent;    
                            
                        }
                
                    } 

                },
                error : function(req,status,error){
                    console.log("에러 발생");
                    console.log(req.responseText);
                }
            });
        }
 
        
})