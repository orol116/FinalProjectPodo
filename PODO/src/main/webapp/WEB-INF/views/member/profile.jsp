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
                            
                        </div>
                        <div>
                            <%-- <button id="chatting">1대1 채팅하기</button> --%>
                            <!-- <form class="openChat" id="openChat" method="POST" action="${contextPath}/member/podoTalk">
                                <c:if test="${!empty loginMember }">
                                    <div class="btn-area">
                                        <button id="chatting">1대1 채팅하기</button>
                                    </div>
                                </c:if>
                            </form> -->
                        </div>
                    </div>


                    <div id="user-profile-right">
                        <div id="user-name-right">${member[0].memberNickname}</div>
                        <div id="user-town">${addr[0]}</div>
                        <div id="user-town">${addr[1]}</div>

                        <c:if test="${member[0].shopInfo != null}">
                            <div id="user-intro">${member[0].shopInfo}</div>
                        </c:if>

                        <c:if test="${member[0].shopInfo == null}">
                            <div id="user-intro">상점 소개가 없습니다.</div>
                        </c:if>

                        <div id="user-space">
                            <div id="user-items-count">상품 : ${boardCount}개</div>
                            <div id="user-start-day">상점 개시일 : </div>
                            <div id="user-items-count">판매 이력 : </div>
                        
                        </div>
                        
                        <div id="user-cutoff">

                                <div id="user-intro-change">소개 수정</div>
                                <div id="item-report">신고/차단하기</div>
                            
                        </div>

                        <!-- <%-- 모달창 --%> -->
                        <div class="background">
                            <div class="window">
                              <div class="popup">
                                <button id="close" type="button">팝업닫기</button>
                                <div id="report-text">신고할 내용을 입력해주세요.</div>
                                <div id="report-area">
                                    <textarea id="report" placeholder="신고할 내용을 입력해주세요."></textarea>   
                                </div>
                                <div id="selectBtn-area">
                                    <select name="key" id="search-key">
                                        <option value="기타">기타</option>
                                        <option value="광고">광고</option>
                                        <option value="상품 정보 부정확">상품 정보 부정확</option>
                                        <option value="거래 금지 품목">거래 금지 품목</option>
                                        <option value="허위 매물">허위 매물</option>
                                        <option value="사기 의심">사기 의심</option> 
                                    </select>
                                    <button id="introChange">수정하기</button>
                                    <button id="reportBtn">신고하기</button>
                                </div>

                              </div>
                              <div>
                              </div>
                            </div>
                        </div>
                        
                        
                        
                        
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
        const member2 = ${memberNo}
        const loginMemberNo = "${loginMember.memberNo}"
        const boardNo = "${boardNo}"

        var imageSrc = "${contextPath}/resources/images/user.jpg";
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/member/profile.js"></script>
    <script src="${contextPath}/resources/js/myshopModal.js"></script>
    <%-- 카테고리 js --%>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
</body>
</html>