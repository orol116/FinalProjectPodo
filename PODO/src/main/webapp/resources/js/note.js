function noteList(){
    
    $.ajax({
        url : contextPath + "/note",
        type : "GET",
        dataType : "JSON", 

        success : function(nList){

            const noteList = document.getElementById("noteList");
            noteList.innerHTML = "";

            if(nList != null){

                for(let note of nList){
                    
                    const noteContent = document.createElement("p");
                    noteContent.innerHTML = note.noteContent +"<br>"
                                            +note.noteDate; 
                    
                    noteList.append(noteContent);                    
                }
                
            } else {
                noteList.classList.add("noNote");
                const p = document.createElement("p");
                p.innerText = "알림이 없습니다";
                
                noteList.append(p);
            }


        },
        error : function(req,status,error){
            console.log("에러 발생");
            console.log(req.responseText);
        }
    });
}