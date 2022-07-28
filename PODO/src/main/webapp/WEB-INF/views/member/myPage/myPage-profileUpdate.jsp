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
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-profileUpdate-style.css">

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    
    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
    <style>
    </style>
</head>
<body>
    <main>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 프로필 이미지 변경 -->
    <section class=myPage-content>

        <!-- 사이드 메뉴 -->
        <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />

        <section class="myPage-inner">
                
            <section class="myPage-main">
                
                <form action="profile" method="POST" name="myPage-form" enctype="multipart/form-data" onsubmit="return profileValidate()">

                    <h1 class="myPage-title">프로필</h1>
                    <span class="myPage-explanation">프로필 이미지를 변경할 수 있습니다.</span>

                    <div class="profile-image-area">

                        <c:if test="${empty loginMember.memberProfile}">
                            <div class="Img">
                                <label for="input-image">
                                    <img src="${contextPath}/resources/images/image.png" class="preview" id="profile-image">
                                </label>
                            </div>
                                <!-- 프로필 이미지 삭제 버튼 -->
                                <span id="delete-image">&times;</span>
                        </c:if>

                        <c:if test="${!empty loginMember.memberProfile}">
                            <div class="Img">
                                <label for="input-image"> 
                                    <img src="${contextPath}${loginMember.memberProfile}" class="preview" id="profile-image">
                                </label>
                                <input type="file" name="uploadImage" id="input-image" accept="image/*">
                                <!-- 프로필 이미지 삭제 버튼 -->
                                <span id="delete-image">&times;</span>
                            </div>
                        </c:if>

                    </div>

                        <input type="hidden" name="delete" id="delete" value="0">
              
            </section>
                <div class="box1">
                    <div class="myPage-row">
                        <label>닉네임</label>
                        <input type="text" name="updateNickname"  id="memberNickname" class="input_box" value="${loginMember.memberNickname}" maxlength="8" placeholder="영어, 숫자, 한글을 조합하여 2~10글자 이내로 작성해주세요.">
                    </div>
        
                        <!-- <button id="info-address-btn" class="button btnPush btnPurple">변경하기</button> -->
                        <button id="button btnPush" class="button btnPush">변경하기</button>
                </div>   
                </form>

        </section>
    
    </main>

    <!-- sweetAlert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- 다음 API -->
    <div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:11;-webkit-overflow-scrolling:touch;">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/myPage.js"></script>
</body>
</html>