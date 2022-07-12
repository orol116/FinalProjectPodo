<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 이미지 변경</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/myPage-profileUpdate-style.css">
</head>
<body>
    <main>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 사이드 메뉴 -->
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />


    <!-- 프로필 이미지 변경 -->
    <section class="myPage-main">

        <h1 class="myPage-title">프로필</h1>
        <span class="myPage-explanation">프로필 이미지를 변경할 수 있습니다.</span>
        

        <form action="profile" method="POST" name="myPage-form" 
              enctype="multipart/form-data" onsubmit="return profileValidate()">


            <div class="profile-image-area">

                <c:if test="${empty loginMember.memberProfile}">
                    <img src="${contextPath}/resources/images/user.png" id="profile-image">
                </c:if>

                <c:if test="${!empty loginMember.memberProfile}">
                    <img src="${contextPath}${loginMember.memberProfile}" id="profile-image">
                </c:if>

                <!-- 프로필 이미지 삭제 버튼 -->
                <span id="delete-image">x</span>

            </div>


            <div class="profile-btn-area">
                <label for="input-image">이미지 선택</label>
                <input type="file" name="memberProfile" id="input-image" accept="image/*">
                <!-- accept="image/*" : 이미지 파일 확장자만 선택 허용 -->
                <!-- accept="video/*" : 동영상 파일 확장자만 선택 허용 -->
                <!-- accept=".pdf" : pdf파일만 선택 허용 -->

                <button type="submit">변경하기</button>
            </div>


            <div class="myPage-row">
                <label>닉네임</label>
                <span>${loginMember.memberNickname}</span>
            </div>

            <div class="myPage-row info-title">
                <label>주소</label>
                <span>${loginMember.memberAddress}</span>
            </div>

            <div class="myPage-row info-address">
                <input type="text" name="updateAddress" id="postcode" value="${addr[0]}"  maxlength="6">

                <button type="button" id="info-address-btn" onclick="execDaumPostcode()">검색</button>
            </div>

            <div class="myPage-row info-address">
                <input type="text" name="updateAddress" id="address" value="${addr[1]}">
            </div>
            
            <div class="myPage-row info-address">
                <input type="text" name="updateAddress" id="detailAddress" value="${addr[2]}">
            </div>

            <!-- 삭제버튼(x)이 눌러짐을 기록하는 숨겨진 input 태그 -->
            <!-- 0 : 안눌러짐   /   1: 눌러짐 -->
            <input type="hidden" name="delete" id="delete" value="0">
        </form>

    </section>
    
    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/myPage.js"></script>
</body>
</html>