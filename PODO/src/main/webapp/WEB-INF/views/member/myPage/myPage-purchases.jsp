<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래내역</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/footer-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/purchases.css">
</head>
<body>

    <header class="">
        <h1>거래내역</h1>
    </header>

    <main class="">

    </main>
    

    <main class="">
        <nav class="">
            <!-- 구매 내역 메뉴 -->
            <ul class="">

                <li class="selected">
                    <button type="button" data-index="0">구매</button>
                </li>

                <li class="">
                    <button type="button" data-index="1">판매</button>
                </li>

            </ul>

            <div class="">
                <!-- 상태 검색 메뉴 -->
                <nav class="">
                    <div>
                        <button class="">전체 상태</button>
                        <button class="">진행중</button>
                        <button class="">완료</button>
                        <button class="">취소/환불</button>
                    </div>
                </nav>

                <!-- 구매/판매 내역 조회 -->
                <div class="">
                    <div class="">구매/판매 내역이 없습니다.</div>
                </div>


                <table class="list-table">
                    
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>이미지</th>
                            <th>가격</th>
                            <th>작성일</th>
                            <th>판매지역</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:choose>
                            <c:when test="${empty ItemBoard}">
                                <!-- 조회 결과가 비어있다면 -->
                                <tr>
                                    <th colspan="5">구매/판매 내역이 없습니다.</th>
                                </tr>
                            </c:when>

                            <c:otherwise>
                                <!-- 조회 결과가 비어있지 않다면 -->

                                <c:forEach var="board" items="${ItemBoard}">
                                    <tr>
                                        <%-- 제목 --%>
                                        <td>${board.boardTitle}</td>
                                        <%-- 이미지 --%>
                                        <td> 
                                            <c:if test="${!empty boardImage.imageOriginal}">
                                                <img class="list-thumbnail" src="${contextPath}${boardImage.imageOriginal}">
                                            </c:if>  
                                        </td>
                                        <%-- 가격 --%>
                                        <td>${board.price}</td>
                                        <%-- 작성일 --%>
                                        <td>${board.createDate}</td>
                                        <%-- 판매지역 --%>
                                        <td>${board.sellArea}</td>
                                    </tr>
                                </c:forEach>

                            </c:otherwise>
                        </c:choose>
                    </tbody>


                </table>


            </div>
        </nav>
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