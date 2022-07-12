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
            <h3>비밀번호 찾기</h3>
            <form action="findPw" method="POST" name="ID-form" id="ID-form">
                <fieldset id="ID-area">

                    <section>
                        <h4>이름</h4>
                        <input type="text" id="name-box" maxlength="20" placeholder="이름을 입력해주세요.">
                        <h4>아이디</h4>
                        <input type="text" id="name-box" maxlength="20" placeholder="아이디를 입력해주세요.">

                        <h4>전화번호</h4>
                        <input type="text" id="phone-box" placeholder="전화번호를 입력해주세요.">
                   

                    
                        <button id="submitBtn" class="submitBtn">인증번호 받기</button>
                        <!-- script로 인증버튼 누를 때 추가 -->
                        <input type="text" id="Cer-number" placeholder="인증번호를 입력하세요">
                    </section>

                </fieldset>
            </form>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    </main>

    
</body>
</html>