<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래내역 조회 페이지</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/member/purchases.css">
    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css"> -->
    <!-- <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css"> -->
    <%-- <link rel="stylesheet" href="${contextPath}/resources/css/footer-style.css"> --%>
    <%-- <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css"> --%>

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

    <style>
    </style>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />



<body onload="init();">
<main>


    <!-- header -->
    <%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    
    <div class="top-menu">
        <nav id="mainMenu">
            <a href="${contextPath}/member/itemUpload">상품등록</a>
             <a href="${contextPath}/shop/main">상품관리</a> 
            <a href="${contextPath}/shop/myMall">구매/판매 내역</a>
        </nav>
    </div>

    <div id="root">
        <div class="page-body">
            <div class="page-body-div">

                <header class="pageHeader">
                    <h1>거래내역</h1>
                </header>

               <div>
                    <nav class="navigator">

                        <ul class="category" style="padding:0;">
                            
                            <button type="button" id="sellList" onclick="selectTradeCondition(1)">판매</button>
                            <button type="button" id="buyList"  onclick="selectTradeCondition(5)">구매</button>
                            <!-- 밑줄 선 -->
                            <!-- <li class="line" role="presentation"></li> -->
                        </ul>

                        <div class="purchases-box">
                            <nav class="purchases-category" id="purchases-category">
                                <div class="menu-wrap">
                                    <button type="button" class="status" id="whole"     onclick="selectTradeCondition(1)">전체 상태</button>
                                    <button type="button" class="status" id="reserving" onclick="selectTradeCondition(2)">예약 중</button>
                                    <button type="button" class="status" id="selling"   onclick="selectTradeCondition(3)">판매 중</button>
                                    <button type="button" class="status" id="selled"    onclick="selectTradeCondition(4)">판매완료</button>
                                </div>
                            </nav>

                            <div class="purchases-contents">
                            
                                <%-- 거래 내역 출력부 --%>
                                <div class="sellContents" id="sellContents"></div>

                            </div>

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>


</main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const memberNo = "${loginMember.memberNo}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/purchases.js"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
</body>
</html>