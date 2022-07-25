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
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

    <style>
    </style>
</head>

<body onload="init();">
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
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

                <main class="purchases-body">

                    <nav class="navigator">

                        <ul class="category">
                            <li class="selected">
                                <button type="button" data-index="0" onclick="showSellList()">판매</button>
                            </li>
                            <li class="">
                                <button type="button" data-index="1" onclick="showBuyList()">구매</button>
                            </li>
                            <!-- 밑줄 선 -->
                            <li class="line" role="presentation"></li>
                        </ul>

                        <div class="purchases-box">
                            <nav class="purchases-category">
                                <div>
                                    <button type="button" class="whole-status">전체 상태</button>
                                    <button type="button" class="reserved">예약중</button>
                                    <button type="button" class="forSale">판매중</button>
                                    <button type="button" class="soldOut">판매완료</button>
                                </div>
                            </nav>

                            <div class="purchases-contents">
                            <%-- 
                                판매 / 구매 내역 처음 페이지 로드 시 전부 가져옴
                                즉시실행함수로 판매 내역 부터 보이게 설정
                                판매 내역 조회 버튼 클릭 시 구매 내역 div 부분 스크립트로 hide 처리
                                반대로 구매 내역 조회 버튼 클릭 시 판매 내역 div 부분 스크립트로 hide 처리
                            --%>
                                        
                                <%-- 판매 내역 --%>
                                <div class="sellContents">
                                    <c:choose>
                                        <c:when test="${empty sellList}">
                                            <!--  판매 내역 조회 결과가 비어있다면 -->
                                            <div>
                                                <div class="purchases-info">판매 내역이 없습니다.</div>
                                            </div>
                                        </c:when>

                                        <%-- -------------------------------------------------------------------------------------------------- --%>
                                        <%-- 판매내역 출력부 --%>

                                        <%-- 출력 부 테스트 --%>
                                        <c:otherwise>
                                            <c:forEach var="buy" items="${sellList}">

                                                <%-- 판매내역 카드 --%>
                                                <div class="history">
                                                    <div>
                                                        <div class="productSummaryCard">
                                                            <%-- 상품 썸네일 영역 --%>
                                                            <div class="productSummaryCard-thumbNail">
                                                                <img src="#" alt="상품 이미지">
                                                                <span class="productSummaryCard-status">
                                                                    <img src="${contextPath}/resources/images/ic-circle-tick@3x.png" alt="">거래완료
                                                                </span>
                                                            </div>
                                                            <%-- 물품 정보 --%>
                                                            <aside class="productSummaryCard-container">
                                                                <span class="productSummaryCard boardTitle">${board.boardTitle}</span>
                                                                <span class="productSummaryCard price"><strong>${board.price}</strong>원</span>
                                                                <span class="productSummaryCard memberNick">${member.memberNick}</span>
                                                                <%-- 거래 완료일시, 컬럼 추가 필요?? --%>
                                                                <span class="productSummaryCard-updateDate">
                                                                    <time datetime="">board.updateDate</time>
                                                                </span>
                                                            </aside>
                                                            
                                                            </div>
                                                            <%-- 후기 작성 --%>
                                                            <div class="buttonContainer">
                                                                <button class="review-button">후기 작성</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                
                                            </c:forEach>
                                        </c:otherwise>
                                        <%-- -------------------------------------------------------------------------------------------------- --%>
                                    
                                        
                                    </c:choose>
                                </div>

                                <%-- 구매 내역 --%>
                                <div class="buyContents">
                                    <c:choose>
                                        <c:when test="${empty buyList}">
                                            <!--  구매 내역 조회 결과가 비어있다면 -->
                                            <div>
                                                <div class="purchases-info">구매 내역이 없습니다.</div>
                                            </div>
                                        </c:when>
                                    
                                         <c:otherwise>
                                            <c:forEach var="buy" items="${buyList}">

                                                <%-- 구매내역 카드 --%>
                                                <div class="history">
                                                    <div>
                                                        <div class="productSummaryCard">
                                                            <%-- 상품 썸네일 영역 --%>
                                                            <div class="productSummaryCard-thumbNail">
                                                                <img src="#" alt="상품 이미지">
                                                                <span class="productSummaryCard-status">
                                                                    <img src="${contextPath}/resources/images/ic-circle-tick@3x.png" alt="">거래완료
                                                                </span>
                                                            </div>
                                                            <%-- 물품 정보 --%>
                                                            <aside class="productSummaryCard-container">
                                                                <span class="productSummaryCard boardTitle">${board.boardTitle}</span>
                                                                <span class="productSummaryCard price"><strong>${board.price}</strong>원</span>
                                                                <span class="productSummaryCard memberNick">${member.memberNick}</span>
                                                                <%-- 거래 완료일시, 컬럼 추가 필요?? --%>
                                                                <span class="productSummaryCard-updateDate">
                                                                    <time datetime="">board.updateDate</time>
                                                                </span>
                                                            </aside>
                                                            
                                                            </div>
                                                            <%-- 후기 작성 --%>
                                                            <div class="buttonContainer">
                                                                <button class="review-button">후기 작성</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                    
                                </div>
                            </div>

                        </div>
                    </nav>
                </main>
            </div>
        </div>
    </div>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/purchases.js"></script>
</body>
</html>