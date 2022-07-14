<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-profileUpdate-style.css">


</head>
<body>
    <main>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 사이드 메뉴 -->
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />

            <div id="contaioner">
            <h3>비밀번호 변경</h3>
            <form action="inputPw" method="POST" name="new-PW-form" id="new-PW-form">
                <fieldset id="ID-area">

                    <section>
                        <h4>새 비밀번호</h4>
                        <input type="password" id="new-password" maxlength="20" name="memberPw" placeholder="새 비밀번호를 입력해주세요.">
                        <h4>새 비밀번호 확인</h4>
                        <input type="password" id="new-password-confirm" name="memberPwConfirm" placeholder="비밀번호를 다시 입력해주세요.">
                   

                        <button id="submitBtn">제출</button>
                    </section>

                </fieldset>
            </form>

        </div>
    
    
    </main>
    

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- js -->
    
</body>
</html>