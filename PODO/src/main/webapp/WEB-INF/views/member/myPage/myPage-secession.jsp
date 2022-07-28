<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원탈퇴</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-profileUpdate-style.css">

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    
    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
</head>
<body>
    
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section class=myPage-content>

        <!-- 사이드 메뉴 -->
        <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />


        <!-- 오른쪽 마이페이지 상단  -->
        <section class="myPage-inner">
                
            <section class="myPage-main">

                <form action="secession" method="POST" name="myPage-form"  onsubmit="return secessionValidate()">
                
                    <h1 class="myPage-title">회원 탈퇴 안내</h1>
                    
                    <h4 class="myPage-subtitle">회원 탈퇴 안내</h4>
                    
                    <div class="wrapper">  
                        
                        
                        
                        <span id="secession-subexplanation">고객님께서 회원 탈퇴를 원하신다니 저희 사이트의 서비스가 많이 부족하고 미흡했나 봅니다. 불편하셨던 점이나 불만사항을 <br>알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
                        </span>           
                        
                        
                        <span class="myPage-subexplanation2">아울러 회원 탈퇴시 아래 사항을 숙지하시기 바랍니다.</span>

                        <div class="myPage-row info-title">
                            <label>유의 사항</label>
                        </div>
                        <pre id="secession-terms">
                        <br>
 1. 회원 탈퇴 시 고객님의 정보는 소비 보호에 관한 법류에 의거한 고객 정보 보호정책에 따라 관리됩니다.
<br>
 2. 회원 탈퇴 후 30일간 재가입이 불가능합니다.
                        </pre>
                        <div>
                            <input type="checkbox" name="agree" id="agree">
                            <label for="agree">위 유의사항을 확인했습니다.</label>
                        </div>
                        
                        <div class="myPage-row">
                            <label>비밀번호</label>
                            <input type="password" name="memberPw" id="memberPw" maxlength="30">   
                            
                        </div>
                        <span class="myPage-subexplanation">정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</span>



                        <%-- <button id="info-update-btn">취소</button> --%>
                        <button id="info-update-btn">탈퇴</button>

                    </div> 

                </form>

            </section>

        </section>
        
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
<script src="${contextPath}/resources/js/member/headCategory.js"></script>

</body>
</html>