// 유효성 검사 여부를 기록할 객체 생성
const checkObj = { 
    "memberId"     : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberNickname"  : false,
    "memberTel"       : false,
    "memberAddress"   : false
    //"sendEmail"       : false   // 인증번호 발송 체크
};



// 전화번호 유효성 검사
const memberTel = document.getElementById("memberTel");
const telMessage = document.getElementById("telMessage");

// ** input 이벤트 **
// -> 입력과 관련된 모든 동작(key관련, mouse관련, 붙여넣기)
memberTel.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if(memberTel.value.length == 0){
        telMessage.innerText = "전화번호를 입력해주세요.(- 제외)";

        //telMessage.classList.remove("confirm");
        //telMessage.classList.remove("error");
        telMessage.classList.remove("confirm", "error");

        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록

        return;
    }

    // 전화번호 정규식
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regExp.test(memberTel.value)){ // 유효한 경우
        telMessage.innerText = "유효한 전화번호 형식입니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");

        checkObj.memberTel = true; // 유효한 상태임을 기록
        
    } else{ // 유효하지 않은 경우
        telMessage.innerText = "전화번호 형식이 올바르지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkObj.memberTel = false; // 유효하지 않은 상태임을 기록
    }
});




// 아dl디
const memberId = document.getElementById("memberId");
const idMessage = document.getElementById("idMessage");

memberId.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if( memberId.value.length == 0 ){
        idMessage.innerText = "아이디를 입력해주세요.";
        idMessage.classList.remove("confirm", "error");

        checkObj.memberId = false; // 유효 X 기록
        return;
    }

    // 입력된 경우
    const regExp = /^[a-zA-Z0-9]{4,15}$/;

    const idResult = 0;



    if( regExp.test(memberId.value) ){ // 유효한 경우

        
        checkObj.memberId = true;
        idMessage.innerText = "사용 가능한 아이디 입니다.";
        idMessage.classList.add("confirm");
        idMessage.classList.remove("error");

        
        
         document.getElementById("idDupCheck").addEventListener("click",function(){
            $.ajax({
                url : "idDupCheck",   
                
    
                data : { "memberId" : memberId.value },
                
                type : "GET", // 데이터 전달 방식 type
    
                success : function(result){
                    
    
                    if(result == 1){ 
                        idMessage.innerText = "이미 사용중인 아이디 입니다.";
                        idMessage.classList.add("error");
                        idMessage.classList.remove("confirm");
                        checkObj.memberId = false; // 유효 X 기록

                        idResult = 1;
    
                    } else { 
                        idMessage.innerText = "사용 가능한 아이디 입니다.";
                        idMessage.classList.add("confirm");
                        idMessage.classList.remove("error");
                        checkObj.memberId = true; 

                        idResult = 2;
                    }
                    

                },
                
                error : function(req, status, error){
                    console.log(req.responseText);
                }
            });

        });

    }else{
        idMessage.innerText = "아이디 형식이 유효하지 않습니다.";
        idMessage.classList.add("error");
        idMessage.classList.remove("confirm");

        /* idResult = 0; */

        checkObj.memberId = false; // 유효 X 기록
    }

});


// 닉네임 유효성 검사
const memberNickname = document.getElementById("memberNickname");
const nicknameMessage = document.getElementById("nicknameMessage");

memberNickname.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(memberNickname.value.length == 0){
        nicknameMessage.innerText = "영어/숫자/한글 2~8글자 사이로 작성해주세요.";
        nicknameMessage.classList.remove("confirm", "error");

        checkObj.memberNickname = false; // 유효 X 기록
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,8}$/;

    if( regExp.test(memberNickname.value) ){ // 유효한 경우

        checkObj.memberNickname = true; // 유효 O 기록

        nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";

        nicknameMessage.classList.add("confirm");
        nicknameMessage.classList.remove("error");
        

    document.getElementById("nicknameDupCheck").addEventListener("click", function(){


        checkObj.memberNickname = true; // 유효 O 기록

        nicknameResult = 2;
            $.ajax({
            url : "nicknameDupCheck",  // 필수 작성 속성
            data : { "memberNickname" : memberNickname.value }, // 서버로 전달할 값(파라미터)
            type : "GET", // 데이터 전달 방식(기본값 GET)

            success : function(res){ 

                if(res == 0){ // 닉네임 중복 X
                    nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");
                    checkObj.memberNickname = true; // 유효 O 기록

                    nicknameResult = 2;

                } else { // 닉네임 중복 O
                    nicknameMessage.innerText = "이미 사용중인 닉네임 입니다.";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    checkObj.memberNickname = false; // 유효 O 기록

                    nicknameResult = 1;
                }
            },

            error : function(){ // 비동기 통신 중 에러가 발생한 경우
                console.log("에러 발생");
            }
        }); 


    });      

    }else{
        nicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");

        checkObj.memberNickname = false; // 유효 X 기록
    }

});



// 비밀번호 유효성 검사
const memberPw = document.getElementById("memberPw");
const memberPwConfirm = document.getElementById("memberPwConfirm");
const pwMessage = document.getElementById("pwMessage");
const pwConfirmMessage = document.getElementById("pwConfirmMessage");

memberPw.addEventListener("input", function(){

    if(memberPw.value.length == 0){
        pwMessage.innerText = "영어, 숫자, 특수문자(!,@,#,-,_) 4~15글자 사이로 작성해주세요.";
        pwMessage.classList.remove("confirm", "error");

        checkObj.memberPw = false; // 유효 X 기록
        return;
    }

    const regExp = /^(?=.*[a-zA-z])(?=.*[~!@#$%^&*+=-])(?=.*[0-9]).{4,15}$/;

    if( regExp.test(memberPw.value) ){ // 비밀번호 유효

        checkObj.memberPw = true; // 유효 O 기록

        if(memberPwConfirm.value.length == 0){ // 비밀번호 유효, 확인 작성 X
            pwMessage.innerText = "유효한 비밀번호 형식입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");

            
            
            

            checkObj.memberPw = true;
        
        } else { // 비밀번호 유효, 확인 작성 O
            checkPw(); // 비밀번호 일치 검사 함수 호출()
        }

    }else{
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkObj.memberPw = false; // 유효 X 기록
    }
});


// 비밀번호 확인 유효성 검사

// 함수명() : 함수 호출(수행)
// 함수명   : 함수에 작성된 코드 반환
memberPwConfirm.addEventListener("input", checkPw );
// -> 이벤트가 발생 되었을 때 정의된 함수를 호출하겠다


function checkPw(){ // 비밀번호 일치 검사
    // 비밀번호 / 비밀번호 확인이 같을 경우
    if(memberPw.value == memberPwConfirm.value){
        pwMessage.innerText = "비밀번호가 일치합니다.";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");

        pwConfirmMessage.innerText = "비밀번호가 일치합니다.";
        pwConfirmMessage.classList.add("confirm");
        pwConfirmMessage.classList.remove("error");


        checkObj.memberPwConfirm = true; // 유효 O 기록

    } else{
        pwMessage.innerText = "비밀번호가 일치하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        pwConfirmMessage.innerText = "비밀번호가 일치하지 않습니다.";
        pwConfirmMessage.classList.remove("confirm");
        pwConfirmMessage.classList.remove("error");

        checkObj.memberPwConfirm = false; // 유효 X 기록
    }
}

const memberAddress = document.getElementById("memberAddress");
const addressMessage = document.getElementById("addressMessage");

memberAddress.addEventListener("input", function(){

    if(memberAddress.value.length == 0){
        addressMessage.innerText = "주소를 작성해주세여.";
        addressMessage.classList.remove("confirm", "error");

        checkObj.memberAddress = false; // 유효 X 기록
        return;
    }else{
        addressMessage.innerText = "주소가 작성되었습니다.";
        checkObj.memberAddress = true;
    }

});







// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate(){

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    let str;

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberEmail":     str="이메일이"; break;
            case "memberPw":        str="비밀번호가"; break;    
            case "memberPwConfirm": str="비밀번호 확인이"; break;
            case "memberNickname":  str="닉네임이"; break;
            case "memberTel":       str="전화번호가"; break;
            case "memberAddress" : str="주소가"; break;
            }

            str += " 유효하지 않습니다.";

            alert(str);

            document.getElementById(key).focus();
            
            return false; // form태그 기본 이벤트 제거
        }
    }


    /* if(idResult != 2 && nicknameResult != 2){
        
        alert("중복검사를 진행해주세요");

        return false;

    } */ 

    return true; // form태그 기본 이벤트 수행

};


// 주소 검색
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
        }
    }).open();
}