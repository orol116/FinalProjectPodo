<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>

    <link rel="stylesheet" href="resources/css/main-style.css">
    <link rel="stylesheet" href="resources/css/member/sideMenu.css">
    <link rel="stylesheet" href="resources/css/member/myPage-profileUpdate-style.css">


</head>
<body>
    <main>

    <%-- header --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 사이드 메뉴 -->
    <jsp:include page="/WEB-INF/views/member/sideMenu.jsp" />


    <!-- 오른쪽 마이페이지 상단  -->
    <section class="myPage-inner">
            
        <section class="myPage-main">
            
            <form action="info" method="POST" name="myPage-form" onsubmit="return infoValidate()" >
                
                <h1 class="myPage-title">회원 정보 수정</h1>
                
          
                <div class="wrapper">

                    <!-- 아이디(작성 불가/변경 불가) -->
                    <div class="myPage-row">
                        <label>아이디</label>
                        <input type="text" name="memberId" readonly>
                    </div>
    
                    <!-- 현재비밀번호 / 새 비밀번호 / 새 비밀번호 확인 -->
                    <div class="myPage-row">
                        <label>현재 비밀번호</label>
                        <input type="password" name="memberPw" value="" id="" maxlength="20">
                    </div>
                    <div class="myPage-row">
                        <label>새 비밀번호</label>
                        <input type="password" name="newPw" value="" id="" maxlength="20">
                    </div>
                    <div class="myPage-row">
                        <label>새 비밀번호 확인</label>
                        <input type="password" name="newPwConfirm" value="" id="" maxlength="20">
                    </div>
    
                    <!-- 휴대폰 -->
                    <div class="myPage-row">
                        <label>휴대폰</label>
                        <input type="text" name="memberTel" value="" id="memberTel" maxlength="11">
                    </div>
                    <span class="signUp-message" id="telMessage">"-" 제외</span>

                    <!-- 닉네임 -->
                    <div class="myPage-row">
                        <label>닉네임</label>
                        <input type="text" name="" value="" id="" maxlength="10">
                    </div>




                    <!-- 소셜연동? -->
                    

                    <!-- 약관동의? -->
                    

                    <button id="info-update-btn">탈퇴하기</button>
                    <button id="info-update-btn">회원정보수정</button>
                </div>
    

            </form>

        </section>

    </section>
    
    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>


</body>
</html>