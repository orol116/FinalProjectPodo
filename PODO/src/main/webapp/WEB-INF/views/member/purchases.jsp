<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래내역 조회 페이지</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css">
    <%-- <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css"> --%>
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/purchases.css">
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    
</head>

<body>
    
    <div class="top-menu">
        <nav id="mainMenu">
            <a href="#">상품등록</a>
            <a href="#">상품관리</a>
            <a href="#">구매/판매 내역</a>
        </nav>
    </div>

    <div id="root">
        <div class="page-body">
            <div class="">

                <header class="pageHeader">
                    <h1>거래내역</h1>
                </header>

                <main class="purchases-body">
                    <nav class="navigator">

                        <ul class="category">
                            <li class="selected">
                                <button type="button" data-index="0">구매</button>
                            </li>
                            <li class="">
                                <button type="button" data-index="1">판매</button>
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
                            <c:choose>
                                <c:when test="${empty buyList}">
                                    <!--  예약 조회 결과가 비어있다면 -->
                                    <div>
                                        <div class="purchases-info">구매내역이 없습니다.</div>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach var="buy" items="${buyList}">
                                        <%-- 구매내역 출력부 --%>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>    
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