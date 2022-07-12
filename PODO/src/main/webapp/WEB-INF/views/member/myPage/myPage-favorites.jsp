<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜 상품 조회</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
</head>
<body>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 사이드 메뉴 -->
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />
    
    <!-- 본문 영역 -->
    <section class="myPage-inner">
            
        <section class="myPage-main">
            
            <h1 class="myPage-title">찜 상품 조회</h1>

            <!-- 찜 상품 카운트 -->
            <div class="fav-count"> <!-- 찜 카운트 영역 -->
                <div>"찜"
                    <span class="count">1</span>
                </div>
            </div>

            <!-- 찜 목록 본문 -->
            <div class="fav-contents">

                <!-- 찜 상단 체크 박스 / 선택 삭제 -->
                <div class="fav-header">
                    <div class="fav-header-left">

                        <!-- 상단 체크박스 -->
                        <div class="check-area">
                            <button type="button" class="fav-check-btn"></button>
                        </div>

                        <!-- 선택삭제 -->
                        <button class="fav-delete">선택삭제</button>

                    </div>

                    <!-- 찜 정렬 메뉴 -->
                    <select>
                        <option value="new-wish">최신순</option>
                        <option value="high-wish">찜 많은 상품순</option>
                        <option value="lowprice">저가순</option>
                        <option value="highprice">고가순</option>
                    </select>
                </div>

                <!-- 출력부 -->
                <div class="">
                    <!-- 개별 상품 -->
                    <div class="">

                        <!-- 상품 세부 -->
                        <div class="product-detail" href="/products/?ref=?">

                            <!-- 상품 체크박스 -->
                            <div class="check-area">
                                <button type="button" class="fav-check-btn"></button>
                            </div>
                            
                            <!-- 조회된 찜 상품 좌측 이미지 영역 -->
                            <div class="product-img">
                                <img src="" alt="상품 이미지">
                                <div></div>
                            </div>
                                
                            <!-- 조회된 찜 상품 우측 상세 내용 영역 -->
                            <div class="product-wholeContent">
                                <div class="product-info">
                                    
                                    <!-- 판매 상품 제목 -->
                                    <div class="product-title">${board.boardTitle}</div>

                                    <!-- 판매 상품 가격 -->
                                    <div class="product-price">
                                        <div>
                                            ${board.price}
                                        </div>
                                    </div>

                                    <!-- 판매 상품 등록일 -->
                                    <div class="upload-date">${board.createDate}</div>
                                </div>
                                
                                <!-- 위치 정보 -->
                                <div class="location">
                                    <!-- 위치 로고 이미지 -->
                                    <img src="resources/images/location-logo.png" width="15" height="17" alt="위치 아이콘">
                                    ${board.sellArea}
                                </div>
                            </div>

                            
                        </a>
                    </div>
                </div>
            </div>

        </section>

    </section>

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