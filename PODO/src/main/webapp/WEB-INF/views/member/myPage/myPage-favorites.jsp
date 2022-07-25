<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜 상품 조회</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-favorites-style.css">

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
            
                <h1 class="myPage-title">찜 상품 조회</h1>

                <!-- 찜 상품 카운트 -->
                <div class="fav-count"> <!-- 찜 카운트 영역 -->
                    <div>"찜"
                        <span class="count">${fn:length(favorBoard)}</span>
                    </div>
                </div>

                <!-- 찜 목록 본문 -->
                <div class="fav-contents">

                    <c:if test="${favorBoard != null}">

                        <!-- 찜 상단 체크 박스 / 선택 삭제 -->
                        <div class="fav-header">
                            <div class="fav-header-left">

                                <!-- 상단 전체 선택 체크박스 -->
                                <div class="checkArea">
                                    <input type="checkbox" name="select" class="selectAll" value="selectAll" onclick="selectAll(this)">
                                    <%-- <button type="button" class="fav-check-btn"></button> --%>

                                    <!-- 선택삭제(전체 선택) -->
                                    <button type="button" class="deleteAll">선택삭제</button>
                                </div>

                            </div>

                            <!-- 찜 정렬 메뉴 -->
                            <select>
                                <option value="new-wish">최신순</option>
                                <option value="high-wish">찜 많은 상품순</option>
                            </select>
                        </div>

                        <!-- 출력부 -->
                        <div class="">

                            <!-- 개별 상품 -->
                            <div class="">
                                <!-- 상품 세부 -->
                                <div class="product-detail" href="/products/?ref=?">

                                    <!-- 조회된 찜 상품 우측 상세 내용 영역 -->
                                    <div class="product-wholeContent">
                                        <div class="product-info">
                                        
                                                <section id="content">
                                                    <ul>
                                                        <c:choose>
                                                            <c:when test="${empty favorBoard}">
                                                                <!--  조회 결과가 비어있다면 -->
                                                                <tr>
                                                                    <th colspan="5" class="favNothing">찜한 상품이 없습니다.</th>
                                                                </tr>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${favorBoard}" var="favor">
                                                                    <li class="fav-list">
                                                                        
                                                                        <%-- 목록 별 체크박스 --%>
                                                                        <div class=checkbox>
                                                                            <input type="checkbox" class="select" name="select">
                                                                        </div> 

                                                                        <%-- 상품 이미지 --%>
                                                                        <div class="thumb">
                                                                            <c:if test="${fn:length(boardImageList) != null}">
                                                                                <image id="item-image" src="${contextPath}${boardImageList.imageReName}" alt="상품 이미지"></image>
                                                                                <a href="${contextPath}/board/detail/${boardImageList.imageReName}">
                                                                            </c:if>
                                                                        </div>
                                                                    
                                                                        <%-- 상품 정보 --%>
                                                                        <div class="gdsInfo">
                                                                            <p>
                                                                                <span>제목</span>${favor.boardTitle}<br>
                                                                                <span>가격</span>"${favor.price}"원<br>
                                                                                <span>등록일</span>${favor.updateDate}<br>
                                                                                <span>위치</span>
                                                                                    <!-- 위치 로고 이미지 -->
                                                                                    <img src="${contextPath}/resources/images/location-logo.png" width="5" height="5" alt="위치 아이콘">
                                                                                    ${favor.sellArea}
                                                                            </p>
                                                                            <%-- 삭제 버튼 --%>
                                                                            <div class="delete">
                                                                                <button type="button" id="deleteBtn" class="delete-btn" onclick="deleteOne()">삭제</button>
                                                                            </div>
                                                                        </div>   
                                                                    </li>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </ul>
                                                </section>

                                        </div>
                                        
                                        
                                    </div>

                                    
                                </a>
                            </div>
                        </div>
                    </c:if>
                </div>
                
            </section>

        </section>

    </section>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
        const loginMemberNo = "${loginMember.memberNo}";
        const boardCode = "${boardCode}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/fav/favorites.js"></script>
</body>
</html>