<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/find-IDPW.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-profileUpdate-style.css">


</head>
<body>
    <main>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class="myPage-inner" style="margin-top: 60px;">
        <section class="myPage-main">
            <form action="resetPw2" method="POST" name="myPage-form" onsubmit="return changePwValidate()" >
        
                <h1 class="myPage-title">비밀번호 재설정</h1>
                
          
                <div class="wrapper">
                    <!-- 현재비밀번호 / 새 비밀번호 / 새 비밀번호 확인 -->
                    <div class="myPage-row">
                        <c:forEach var="findMember" items="${findMember}">
                            <label name="memberId">PODO 아이디 :</label><span style="color: #5f0081; display: inline;">${findMember}</span> 
                            <input type="hidden" name="memberId" value="${findMember}">
                        </c:forEach>
                    </div>
                    <div class="myPage-row">
                        <label>새 비밀번호</label>
                        <input type="password" name="memberPw" id="newPw" class="input_box" placeholder="영어, 숫자, 특수기호를 포함하여 15자 이내로 작성" maxlength="15">
                    </div>
                    <div class="myPage-row">
                        <label>새 비밀번호 확인</label>
                        <input type="password" name="newPwConfirm" id="newPwConfirm" class="input_box" maxlength="15">
                    </div>

                    <button id="info-update-btn">변경하기</button>

                </div>
    

            </form>
        </section>
    </section>
    

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- js -->
    <script src="${contextPath}/resources/js/myPage.js"></script>
</body>
</html>