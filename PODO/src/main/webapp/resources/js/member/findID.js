function CerValidate(){

    const inputName = document.getElementsByName("memberName")[0];
    
    const inputTel = document.getElementsByName("memberTel")[0];

    const inputPhone2 = document.getElementsByName("phone2")[0];

    //이름이 입력되지 않은 경우 false를 반환
    if(inputName.value.trim().length == 0){

        alert("이름을 입력해주세요.");

        inputName.value = "";
        inputName.focus();
        return false; //기본 이벤트 제거
        
    }

    // //전화번호가 입력되지 않은 경우 false
    // if(inputTel.value.trim().length == 0){
    //     alert("전화번호를 입력해주세요.");
    //     inputTel.value = "";
    //     inputTel.focus();
    //     return false; 
        
    // }

    // if(inputPhone2.value.trim().length == 0){
    //     alert("인증번호를 입력해주세요.");
    //     return false;
    // }

    // $.ajax({
    //     url : "idDupCheck",   
        

    //     data : { "memberId" : memberId.value },
        
    //     type : "GET", // 데이터 전달 방식 type

    //     success : function(result){
            

    //         if(result == 1){ 
    //             idMessage.innerText = "이미 사용중인 아이디 입니다.";
    //             idMessage.classList.add("error");
    //             idMessage.classList.remove("confirm");
    //             checkObj.memberId = false; // 유효 X 기록

    //             idResult = 1;

    //         } else { 
    //             idMessage.innerText = "사용 가능한 아이디 입니다.";
    //             idMessage.classList.add("confirm");
    //             idMessage.classList.remove("error");
    //             checkObj.memberId = true; 

    //             idResult = 2;
    //         }
            

    //     },
        
    //     error : function(req, status, error){
    //         console.log(req.responseText);
    //     }
    // });


    return true;




}; 



