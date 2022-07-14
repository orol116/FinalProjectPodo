<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>podo</title>
    
    <link rel="stylesheet" href="resources/css/main-style.css">
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <link rel="shorcut icon" href="images/favicon.ico">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>


	<div class="slide-list">

        <div class="mySlides"><img src="${contextPath}/resources/images/banner1.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner2-2.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner3-1.png"></div>

    </div>

    <section>
        <div id="itmes"><h2 style="margin:0;">이번주 상품 추천</h2></div>
        <div>
            <div>
                <div class="frame">

                    <c:choose>
                        <c:when test="${empty itemList}">
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </c:when>

                        <c:otherwise>
                            <c:forEach var="item" items="${itemList}">

                                <div class="box">
                                    <a href="${contextPath}/board/detail/${item.boardNo}" class="title">
                                        <div class="image">
                                            <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                        </div>   
                                        <div class="title1">
                                            <div class="title2">${item.boardTitle}</div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
                
        </div>

    </section>
    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- main.js 연결 -->
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>


</body>
</html>