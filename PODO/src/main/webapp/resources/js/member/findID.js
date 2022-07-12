document.getElementById("submitBtn").addEventListener("click", function(){

    var result = 0;

    const inputName = document.getElementsByName("memberNickname")[0];
    
    const inputTel = document.getElementsByName("memberTel")[0];

    //이름이 입력되지 않은 경우 false를 반환
    if(inputName.value.trim().length == 0){

        alert("아이디를 입력해주세요.");

        inputName.value = "";
        inputName.focus();
        result = 0;
        return false; //기본 이벤트 제거
        
    }

    //전화번호가 입력되지 않은 경우 false
    if(inputTel.value.trim().length == 0){
        alert("전화번호를 입력해주세요.");
        inputTel.value = "";
        inputTel.focus();
        result = 1;
        return false; 
        
    }

    const submitBtn = document.getElementById("submitBtn");
    const CerArea = document.getElementById("Cer-area");
    
    if(result != 1){
    
        submitBtn.addEventListener("click",function(){
    
            CerArea.style.display = "flex";
            CerArea.style.flexDirection = "row";
        
        
        });
    
    }

    return true;



});

// 휴대폰 번호 인증
var code2 ="";
$("#submitBtn").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone-box").val();
	$.ajax({
        type:"GET",
        url:"phoneCheck?phone=" + phone,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$("#phone-box").attr("autofocus",true);
        	}else{	        		
        	    alert("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$("phone-box").attr("readonly",true);
        		code2 = data;
        	}
        }
    });
});

 


