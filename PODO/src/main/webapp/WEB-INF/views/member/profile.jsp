<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="addr"  value="${fn:split(member[0].memberAddress, ',,')}"  />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/member-profile.css">
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
                            <image class="profile-image" src="${contextPath}${member[0].memberProfile}" ></image>
                        </div>
                        <div id="user-name-left">${member[0].memberNickname}</div>
                        <div id="user-info">
                            <div id="user-podo">포도 : ${member[0].memberGrape}개</div>
                            <div id="user-items-count">상품 : ${boardCount}개</div>
                            
                        </div>
                        <div>
                            <button id="chatting">1대1 채팅하기</button>
                        </div>
                    </div>


                    <div id="user-profile-right">
                        <div id="user-name-right">${member[0].memberNickname}</div>
                        <div id="user-town">${addr[1]}</div>
                        <div id="user-town">${addr[2]}</div>

                        <c:if test="${member[0].shopInfo != null}">
                            <div id="user-intro">${member[0].shopInfo}</div>
                        </c:if>

                        <c:if test="${member[0].shopInfo == null}">
                            <div id="user-intro">상점 소개가 없습니다.</div>
                        </c:if>

                        <div id="user-cutoff"><a href="#">신고/차단하기</a></div>
                        
                        
                        
                    </div>


                    
                </section>

                <div id="user-category">
                    <button id="item-list" type="button">상품 ${boardCount}개</button>
                    <button id="review-category" type="button">후기 ${reviewCount}개</button>
                </div>

                <section id="seller-items">
               
                </section>
                



                <section id="reviews-area">

                </section> 

                      

            </div>

        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    </main>

        <script>
        const memberNo = ${memberNo}

        const loginMemberNo = "${loginMember.memberNo}"
        const boardNo = "${boardNo}"

        </script>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/js/member/profile.js"></script>
        <script src="${contextPath}/resources/js/myshopModal.js"></script>
    
</body>
</html>