document.getElementById("submitBtn").addEventListener("click", function(){

    var result = 0;

    const inputName = document.getElementsByName("memberNickname")[0];
    
    const inputId = document.getElementsByName("memberId")[0];

    const inputTel = document.getElementsByName("memberTel")[0];

    

    //이름이 입력되지 않은 경우 false를 반환
    if(inputName.value.trim().length == 0){

        alert("아이디를 입력해주세요.");

        inputName.value = "";
        inputName.focus();
        result = 0;
        return false; //기본 이벤트 제거
        
    }

    //아이디가 입력되지 않은 경우 false를 반환
    if(inputId.value.trim().length == 0){

        alert("이름을 입력해주세요.");

        inputId.value = "";
        inputId.focus();
        result = 0;
        return false; //기본 이벤트 제거
        
    }

    //전화번호가 입력되지 않은 경우 false
    if(inputTel.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");
        inputTel.value = "";
        inputTel.focus();
        result = 1;
        return false; 
        
    }

    const submitBtn = document.getElementById("submitBtn");
    const CerArea = document.getElementById("Cer-area");
    
    if(result = 1){
    
        submitBtn.addEventListener("click",function(){
    
            CerArea.style.display = "flex";
            CerArea.style.flexDirection = "row";
        
        
        });
    
    }

    return true;



});

 


