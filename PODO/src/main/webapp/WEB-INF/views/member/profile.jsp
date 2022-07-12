<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/member/member-profile.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>find-ID</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

            
        <div id="contaioner">
            <!-- body 전체 div -->
            <div id="item-page">
                <!-- 이미지 위 카테고리 클릭시 링크로 이동 -->


                <section id="profile-head">
                    <div id="user-profile-left">
                        <div id="user-image-area">
                            <image class="profile-image" src="${contextPath}/images/logo.png" ></image>
                        </div>
                        <div id="user-name-left">유저 이름</div>
                        <div id="user-info">
                            <div id="user-podo">포도 : 100개</div>
                            <div id="user-items-count">상품 : 20개</div>
                            
                        </div>
                        <div>
                            <button id="chatting">1대1 채팅하기</button>
                        </div>
                    </div>

                    <div id="user-profile-right">
                        <div id="user-name-right">유저 이름이름이름</div>
                        <div id="user-town">서울시 중구</div>
                        <div id="user-intro">상세 페이지를 적는 곳입니다.</div>
                        <div id="user-cutoff"><a href="#">신고/차단하기</a></div>
                        
                        <div id="user-detail">
                            <div id="user-subscript">상점 개시일 : 10일 전 </div>
                            <div id="user-views">조회수 : 10회</div>
                            <div id="sell-count">판매 이력 : 12회</div>
                        </div>
                        
                    </div>


                    
                </section>

                <div id="user-category">
                    <div id="item-category">상품 20개</div>
                    <div id="review-category">후기 5개</div>
                </div>

                <section id="seller-items">

                <c:choose>
                    <c:when test="${empty itemList}">
                        판매중인 상품이 없습니다.
                    </c:when>

                    <c:otherwise>

                        <c:forEach var="item" items="itemList">

                            <div class="box">
                                <a href="../images/logo.png" class="title">
                                    <div class="image">
                                        <img src="#"  alt="상품 이미지1">
                                    </div>   
                                    <div class="title1">
                                        <div class="title2">${item.boardTitle}</div>
                                        <div class="name2">
                                            <div class="price">${item.price}</div>
                                            <div class="time">${item.updateDate}</div>
                                        </div>
                                    </div>
                                </a>
                            </div>

                        </c:forEach>

                    </c:otherwise>

                    </c:choose>


                </section>


                <section id="user-reviews">
                    <div id="reviews-top">
                        <image id="reviews-image" src="${contextPath}/images/logo.png"  alt="유저 이름"></image>
                        <div id="reviews-user-nick">유저 닉네임</div>
                        <div id="create-date-area"><div id="reviews-create-date">7일 전</div></div>
                        
                    </div>
                    <div id="reviews-shorts"> 아쉬워요.</div>
                    <div id="reviews-user-text">친절하시고 배송도 빨랐고, 물건 상태도 너무 좋아요 감사합니다!</div>
                    <div id="reviews-footer">
                        <div id="reviews-user-item">구매상품 | 소니 a6000</div>
                        <div id="hideBtn-area">
                            <button id="hideBtn">후기 숨기기</button>
                        </div>
                        

                    </div>

                </section>

                <section id="user-reviews">
                    <div id="reviews-top">
                        <image id="reviews-image" src="${contextPath}/images/logo.png"  alt="유저 이름"></image>
                        <div id="reviews-user-nick">유저 닉네임</div>
                        <div id="create-date-area"><div id="reviews-create-date">7일 전</div></div>
                        
                    </div>
                    <div id="reviews-shorts"> 아쉬워요.</div>
                    <div id="reviews-user-text">친절하시고 배송도 빨랐고, 물건 상태도 너무 좋아요 감사합니다!</div>
                    <div id="reviews-footer">
                        <div id="reviews-user-item">구매상품 | 소니 a6000</div>
                        <div id="hideBtn-area">
                            <button id="hideBtn">후기 숨기기</button>
                        </div>
                        

                    </div>

                </section>

            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>

    
</body>
</html>