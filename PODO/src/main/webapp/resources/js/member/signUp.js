const checkObj = { 
    "memberIddd"     : false,
    "memberPw"        : false,
    "memberPwConfirm" : false,
    "memberName"      : false,
    "memberNicknickname"  : false,
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

    if(regExp.test(memberTel.value)){ 
        telMessage.innerText = "유효한 전화번호 형식입니다.";
        telMessage.classList.add("confirm");
        telMessage.classList.remove("error");

        checkObj.memberTel = true; 
        
    } else{ // 유효하지 않은 경우
        telMessage.innerText = "전화번호 형식이 올바르지 않습니다.";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkObj.memberTel = false; 
    }
});
// 아dl디
const memberIddd = document.getElementById("memberId");
const idMessage = document.getElementById("idMessage");

memberIddd.addEventListener("input", function(){

    // 입력이 되지 않은 경우
    if( memberIddd.value.length == 0 ){
        idMessage.innerText = "아이디를 입력해주세요.";
        idMessage.classList.remove("confirm", "error");

        checkObj.memberIddd = false; // 유효 X 기록
        return;
    }

    // 입력된 경우
    const regExp = /^[a-zA-Z0-9]{4,15}$/;

    if( regExp.test(memberIddd.value) ){ // 유효한 경우
         
            $.ajax({
                url : "idDupCheck",  
                
    
                data : { "memberId" : memberIddd.value },
                
                type : "GET", // 데이터 전달 방식 type
    
                success : function(result){
                    
                    if(result == 1){ 
                        idMessage.innerText = "이미 사용중인 아이디 입니다.";
                        idMessage.classList.add("error");
                        idMessage.classList.remove("confirm");
                        checkObj.memberIddd = false; // 유효 X 기록
                    } else { 
                        idMessage.innerText = "사용 가능한 아이디 입니다.";
                        idMessage.classList.add("confirm");
                        idMessage.classList.remove("error");
                        checkObj.memberIddd = true;    
                    }   
                },
                
                error : function(req, status, error){
                    console.log(req.responseText);
                }
            });
    }else{
        idMessage.innerText = "아이디 형식이 유효하지 않습니다.";
        idMessage.classList.add("error");
        idMessage.classList.remove("confirm");

        /* idResult = 0; */

        checkObj.memberIddd = false; // 유효 X 기록
    }

});
// 닉네임 유효성 검사
const memberName = document.getElementById("memberName");
const nameMessage = document.getElementById("nameMessage");

memberName.addEventListener("input", function(){

       // 입력되지 않은 경우
       if(memberName.value.length == 0){

        checkObj.memberName = false; // 유효 X 기록
        return;
    }else{
        // 입력이 된경우
        checkObj.memberName = true;
    }



});



// 닉네임 유효성 검사
const memberNicknickname = document.getElementById("memberNickname");
const nicknameMessage = document.getElementById("nicknameMessage");

memberNicknickname.addEventListener("input", function(){

    // 입력되지 않은 경우
    if(memberNicknickname.value.length == 0){
        nicknameMessage.innerText = "영어/숫자/한글 2~8글자 사이로 작성해주세요.";
        nicknameMessage.classList.remove("confirm", "error");

        checkObj.memberNicknickname = false; // 유효 X 기록
        return;
    }

    const regExp = /^[a-zA-Z0-9가-힣]{2,8}$/;

    if( regExp.test(memberNicknickname.value) ){ // 유효한 경우

  
            $.ajax({
            url : "nicknameDupCheck",  // 필수 작성 속성
            data : { "memberNickname" : memberNicknickname.value }, // 서버로 전달할 값(파라미터)
            type : "GET", // 데이터 전달 방식(기본값 GET)

            success : function(res){ 

                if(res == 0){ // 닉네임 중복 X
                    nicknameMessage.innerText = "사용 가능한 닉네임 입니다.";
                    nicknameMessage.classList.add("confirm");
                    nicknameMessage.classList.remove("error");
                    checkObj.memberNicknickname = true; // 유효 O 기록

                    

                } else { // 닉네임 중복 O
                    nicknameMessage.innerText = "이미 사용중인 닉네임 입니다.";
                    nicknameMessage.classList.add("error");
                    nicknameMessage.classList.remove("confirm");
                    checkObj.memberNicknickname = false; // 유효 O 기록

                   
                }
            },

            error : function(){ // 비동기 통신 중 에러가 발생한 경우
                console.log("에러 발생");
            }
        });      

    }else{
        nicknameMessage.innerText = "닉네임 형식이 유효하지 않습니다.";
        nicknameMessage.classList.add("error");
        nicknameMessage.classList.remove("confirm");

        checkObj.memberNicknickname = false; // 유효 X 기록
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

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = {
    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
position: new daum.maps.LatLng(37.537187, 127.005476),
map: map
});

let dLat = "";
let dLon = "";


function sample5_execDaumPostcode() {
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("memberAddress").value = addr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);

                dLon = result.x;
                dLat = result.y;

                // 지도를 보여준다.
                mapContainer.style.display = "block";
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords);
                
            }
        });
    }
}).open();
}

const memberAddress = document.getElementById("memberAddress");
const addressMessage = document.getElementById("addressMessage");


/* memberPw.addEventListener("input", function(){
       // 입력되지 않은 경우
       if(memberAddress.value.length == 0){
        checkObj.memberAddress = false; // 유효 X 기록
        return;
    }else{
        // 입력이 된경우
        checkObj.memberAddress = true;
        console.log("입력됨");
        addressMessage.innerText = "주소가 입렫외었습니다.";
        addressMessage.classList.add("confirm");
        addressMessage.classList.remove("error");
    }
}); */

function memberAddr(){

    document.getElementById("dLon").value = dLon;
    document.getElementById("dLat").value = dLat;


    // 입력되지 않은 경우
    if(memberAddress.value.length == 0){
        checkObj.memberAddress = false; // 유효 X 기록
        return;
    }else{
        // 입력이 된경우
        checkObj.memberAddress = true;
        console.log("입력됨");
        addressMessage.innerText = "주소가 입력되었습니다.";
        addressMessage.classList.add("confirm");
        addressMessage.classList.remove("error");
    }
}

// 회원가입 버튼 클릭 시 유효성 검사가 완료 되었는지 확인하는 함수
function signUpValidate(){

    memberAddr();

    // checkObj에 있는 모든 속성을 반복 접근하여
    // false가 하나라도 있는 경우에는 form태그 기본 이벤트 제거

    /* document.getElementById("dLon").value = dLon;
    document.getElementById("dLat").value = dLat; */

    let str;

    console.log(memberAddress.value.length);

    for( let key  in checkObj ){ // 객체용 향상된 for문

        // 현재 접근 중인 key의 value가 false인 경우
        if( !checkObj[key] ){ 

            switch(key){
            case "memberIddd":     str="아이디가"; break;
            case "memberPw":        str="비밀번호가"; break;    
            case "memberPwConfirm": str="비밀번호 확인이"; break;
            case "memberName":  str="이름이"; break;
            case "memberNicknickname":  str="닉네임이"; break;
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
