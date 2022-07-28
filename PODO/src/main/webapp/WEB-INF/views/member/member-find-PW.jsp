<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/member/find-IDPW.css">

    <title>find-PW</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div id="contaioner">
            <h2>비밀번호 찾기</h2>
            <form action="inputPw2" method="POST" name="ID-form" id="ID-form" onsubmit="return CerValidate()">
                <fieldset id="ID-area">

                    <section>
                        <h4>이름</h4>
                        <input type="text" id="name-box" maxlength="20" name="memberName" placeholder="이름을 입력해주세요.">
                        <h4>아이디</h4>
                        <input type="text" id="name-box" maxlength="20" name="memberId" placeholder="아이디를 입력해주세요.">

                        <h4>전화번호</h4>
                        <input id="phone" type="text" name="memberTel" title="전화번호 입력" placeholder="전화번호를 입력해주세요."/>
                    
          
                        
                       
                            
                            <button id="phoneChk" class="doubleChk">인증번호 보내기</button>
                            
                            <div id="Cer-area">
                                <input id="phone2" type="text" name="phone2" title="인증번호 입력" placeholder="인증번호를 입력하세요" disabled required/>
                                <button id="phoneChk2" class="doubleChk">인증번호 확인</button>
                                <input type="hidden" id="phoneDoubleChk"/>
                            </div>
                            <span class="point successPhoneChk"></span> 
    
                        <button id="finalSubmitBtn">제출</button>
                    </section>

                </fieldset>
            </form>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        <script>

            var code2 = "";
            $("#phoneChk").click(function(){
                alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
                var phone = $("#phone").val();
                $.ajax({
                    type:"GET",
                    url:"phoneCheck?phone=" + phone,
                    cache : false,
                    success:function(data){
                        if(data == "error"){
                            alert("휴대폰 번호가 올바르지 않습니다.")
                            $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                            $(".successPhoneChk").css("color","red");
                            $("#phone").attr("autofocus",true);
                        }else{	        		
                            $("#phone2").attr("disabled",false);
                            $("#phoneChk2").css("display","inline-block");
                            $(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
                            $(".successPhoneChk").css("color","green");
                            $("#phone").attr("readonly",true);
                            code2 = data;
                        }
                    }
                });
            });

                        //휴대폰 인증번호 대조
            $("#phoneChk2").click(function(){
                if($("#phone2").val() == code2){
                    $(".successPhoneChk").text("인증번호가 일치합니다.");
                    $(".successPhoneChk").css("color","green");
                    $("#phoneDoubleChk").val("true");
                    $("#phone2").attr("disabled",true);
                }else{
                    $(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
                    $(".successPhoneChk").css("color","red");
                    $("#phoneDoubleChk").val("false");
                    $(this).attr("autofocus",true);
                }
            });

        </script>        

        <script src="${contextPath}/resources/js/member/findPW.js"></script>
        <script src="${contextPath}/resources/js/member/headCategory.js"></script>

    </main>

    
</body>
</html>