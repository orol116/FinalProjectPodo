<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/member/find-IDPW.css">

    <title>find-ID</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div id="contaioner">
            <h3>아이디 찾기</h3>
            <form action="#" method="POST" name="ID-form" id="ID-form" onsubmit="return CerValidate()">
                <fieldset id="ID-area">

                    <section>
                        <h4>이름</h4>
                        <input type="text" id="name-box" maxlength="20" name="memberNickname" placeholder="이름을 입력해주세요.">
                        <h4>전화번호</h4>
                        <input type="text" id="phone-box" name="memberTel1" placeholder="전화번호를 입력해주세요.">
                   

                    
                        <button id="submitBtn" class="submitBtn" type="button">전화번호 인증번호 받기</button>
                        <div id="Cer-area">
                            <input type="text" id="Cer-number" placeholder="인증번호를 입력하세요">
                            <button id="Cer-number-check" type="button">인증번호 확인</button>
                        </div>
                        
                        <button id="finalSubmitBtn">제출</button>
                    </section>

                </fieldset>
            </form>
             <tr class="mobileNo">
                        <th>
                            <label for="phone">휴대폰 번호</label>
                        </th>
                        <td>
                            <p>
                                <input id="phone" type="text" name="memberTel" title="전화번호 입력" required/>
                                <span id="phoneChk" class="doubleChk">인증번호 보내기</span><br/>
                                <input id="phone2" type="text" name="phone2" title="인증번호 입력" disabled required/>
                                <span id="phoneChk2" class="doubleChk">본인인증</span>
                                <span class="point successPhoneChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</span>
                                <input type="hidden" id="phoneDoubleChk"/>
                            </p>
                            <p class="tip">
                                최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)
                            </p>
                        </td>
                    </tr>
        </div>

               

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

        <script>
            var code2 ="";
/*             $("#submitBtn").click(function(){
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
            }); */

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


        </script>        

        <script src="${contextPath}/resources/js/member/findID.js"></script> 


    </main>

    
</body>
</html>
