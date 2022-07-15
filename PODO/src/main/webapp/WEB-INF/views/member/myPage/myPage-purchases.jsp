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
            <a href="${contextPath}/member/itemUpload">상품등록</a>
            <a href="${contextPath}/shop/main">상품관리</a>
            <a href="${contextPath}/shop/myMall">구매/판매 내역</a>
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
                                
                            <%-- test --%>
                            <%-- 
                            <tbody>
                                <th  class="font-alt" style="text-align: center; vertical-align : middle; width:13%;" >주문번호</th>
                                <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">image</th>
                                <th  class="font-alt" class="hidden-xs" style="text-align: center; vertical-align : middle;">item</th>
                                <th  class="font-alt" style="text-align: center; vertical-align : middle; width:14%;">price</th>
                                <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">수량</th>
                                <th  class="font-alt" class="hidden-xs" style="text-align: center; vertical-align : middle; width:13%;">주문상태</th>
                                </tr>

                                    <c:forEach items="${buyList}" var="buyList">
                                    
                                        <tr style="text-align: center; ">
                                        
                                            <td style="padding-left: 0px; padding-right: 0px; vertical-align : middle;">
                                                <fmt:formatDate value="${getOrderList.order_item_date}"/><br/>
                                                <a href="/member/orderDetail?ordered_no=${getOrderList.orderedVO.ordered_no}">${getOrderList.orderedVO.ordered_no}</a>
                                            </td>
                                            <td class="hidden-xs" style="vertical-align : middle;">
                                                <a href="/main/itemContent?item_no=${getOrderList.order_item_no}">
                                                    <img src="/img/${getOrderList.order_item_img}" alt="Accessories Pack"/>
                                                </a>
                                            </td>
                                            <td style="vertical-align : middle;">
                                                <h5 class="product-title font-alt">${getOrderList.order_item_name}</h5>
                                            </td>
                                            <td class="hidden-xs" style="vertical-align : middle;">
                                                <h5 class="product-title font-alt">₩ <fmt:formatNumber pattern="###,###,###" value="${getOrderList.order_item_price}"/><br>
                                                                                
                                                </h5>
                                            </td>
                                            <td class="hidden-xs" style="vertical-align : middle;">
                                                <h5 class="product-title font-alt"> ${getOrderList.order_select_vol}</h5>
                                            </td>
                                        </tr>
                                    </c:forEach>
                            </tbody>
                            --%>
                            <%-- test --%>
                            
                                <%-- 판매 내역 --%>
                                <div class="sellContents">
                                    <c:choose>
                                        <c:when test="${empty sellList}">
                                            <!--  판매 내역 조회 결과가 비어있다면 -->
                                            <div>
                                                <div class="purchases-info">판매 내역이 없습니다.</div>
                                            </div>
                                        </c:when>
                                    
                                        <c:otherwise>
                                            <c:forEach var="sell" items="${sellList}">
                                                <%-- 구매내역 출력부 --%>
                                                <li>
                                                    <div class="thumb">

                                                        <%-- <!-- 업로드 이미지가 있는 경우 -->
                                                        <c:if test="${fn:length(favor.imageOriginal) > start}">

                                                            <!-- 업로드 이미지 영역 -->
                                                            <h5>업로드 이미지</h5>
                                                            <div class="img-box">
                                                                <c:forEach var="i" begin="${start}" end="${fn:length(favor.imageOriginal) -1 }">
                                                                
                                                                    <div class="boardImg">
                                                                        <img src="${contextPath}${favor.imageOriginal[i].imageReName}">
                                                                    </div>

                                                                </c:forEach>
                                                            </div>

                                                        </c:if> --%>

                                                    </div>
                                                    <div class="gdsInfo">
                                                        <p>
                                                            <span>제목</span>${sell.boardTitle}<br>
                                                            <span>가격</span>"${sell.price}"원<br>
                                                            <span>등록일</span>${sell.updateDate}<br>
                                                            <span>위치</span>
                                                                <!-- 위치 로고 이미지 -->
                                                                <img src="${contextPath}/resources/images/location-logo.png" width="5" height="5" alt="위치 아이콘">
                                                                ${sell.sellArea}
                                                        </p>
                                                        
                                                        <div class="review">
                                                            <button type="button" class="review-btn" onclick="location.href='${contextPath}/member/review-write'">후기 작성</button>
                                                        </div>
                                                    </div>   
                                                </li>
                                            </c:forEach>
                                        </c:otherwise>
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
                                                <%-- 구매내역 출력부 --%>
                                                <li>
                                                    <div class="thumb">

                                                        <%-- <!-- 업로드 이미지가 있는 경우 -->
                                                        <c:if test="${fn:length(favor.imageOriginal) > start}">

                                                            <!-- 업로드 이미지 영역 -->
                                                            <h5>업로드 이미지</h5>
                                                            <div class="img-box">
                                                                <c:forEach var="i" begin="${start}" end="${fn:length(favor.imageOriginal) -1 }">
                                                                
                                                                    <div class="boardImg">
                                                                        <img src="${contextPath}${favor.imageOriginal[i].imageReName}">
                                                                    </div>

                                                                </c:forEach>
                                                            </div>

                                                        </c:if> --%>

                                                    </div>
                                                    <div class="gdsInfo">
                                                        <p>
                                                            <span>제목</span>${buy.boardTitle}<br>
                                                            <span>가격</span>"${buy.price}"원<br>
                                                            <span>등록일</span>${buy.updateDate}<br>
                                                            <span>위치</span>
                                                                <!-- 위치 로고 이미지 -->
                                                                <img src="${contextPath}/resources/images/location-logo.png" width="5" height="5" alt="위치 아이콘">
                                                                ${buy.sellArea}
                                                        </p>
                                                        
                                                        <div class="review">
                                                            <button type="button" class="review-btn" onclick="location.href='${contextPath}/member/review-write'">후기 작성</button>
                                                        </div>
                                                    </div>   
                                                </li>
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