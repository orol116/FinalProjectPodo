function loginValidate(){ //로그인 유효성 검사

    const inputEmail = document.getElementsByName("memberId")[0];
    
    const inputPw = document.getElementsByName("memberPw")[0];

    //이메일이 입력되지 않은 경우 false를 반환
    if(inputEmail.value.trim().length == 0){

        alert("아이디를 입력해주세요.");

        inputEmail.value = "";
        inputEmail.focus();

        return false; //기본 이벤트 제거
    }

    //비밀번호가 입력되지 않은 경우 false
    if(inputPw.value.trim().length == 0){
        alert("비밀번호를 입력해주세요.");
        inputPw.value = "";
        inputPw.focus();
        return false; 
    }

    return true;

}


if(document.getElementById("saveId")  != null){ 
    document.getElementById("saveId").addEventListener("change", function(){

    if(this.checked){

        const str = "ID를 저장하시겠습니까?";

        if(!confirm(str)){
            //체크 해제
            this.checked = false;
        }
    }

});
}

