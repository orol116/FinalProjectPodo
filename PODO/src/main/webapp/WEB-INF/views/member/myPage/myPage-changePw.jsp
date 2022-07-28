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

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
</head>
<body>
    <main>

    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class="myPage-content">

        <!-- 사이드 메뉴 -->
        <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />


        <!-- 오른쪽 마이페이지 상단  -->
        <section class="myPage-inner">
                
            <section class="myPage-main">
                
                <form action="changePw" method="POST" name="myPage-form" onsubmit="return changePwValidate()" >
                    
                    <h1 class="myPage-title">비밀번호 변경</h1>
                    
            
                    <div class="wrapper">
        
                        <!-- 현재비밀번호 / 새 비밀번호 / 새 비밀번호 확인 -->
                        <div class="myPage-row">
                            <label>현재 비밀번호</label>
                            <input type="password" name="pw" id="pw" class="input_box"  maxlength="15">
                        </div>
                        <div class="myPage-row">
                            <label>새 비밀번호</label>
                            <input type="password" name="newPw" id="newPw" class="input_box" maxlength="15" placeholder="영어, 숫자, 특수기호를 포함하여 15자 이내로 작성해주세요.">
                        </div>
                        <div class="myPage-row">
                            <label>새 비밀번호 확인</label>
                            <input type="password" name="newPwConfirm" id="newPwConfirm" class="input_box" maxlength="15">
                        </div>


                        <!-- 소셜연동? -->

                        <%-- <button type="button" id="info-update-btn" onclick="location.href='${contextPath}/views/member/mypage/secession'">탈퇴하기</button> --%>
                        <button id="info-update-btn">변경하기</button>

                    </div>
        

                </form>

            </section>

        </section>

    <section>
    
    </main>
    

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- js -->
    <script src="${contextPath}/resources/js/myPage.js"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>

    
</body>
</html>