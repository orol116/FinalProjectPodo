<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="itemList" value="${map.itemList}" />
<c:set var="memberNo" value="${map.memberNo}" />
<c:set var="sellList" value="${map.sellList}" />
<c:set var="sellMember" value="${map.sellMember}" />
<c:set var="boardNo" value="${boardNo}" />
<c:set var="boardImageList" value="${map.boardImageList}" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemManage.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/item-detail.css">
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

    <title>상품 상세페이지</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />
            
        <div id="contaioner">
            <!-- body 전체 div -->
            <div id="item-page">
                <!-- 이미지 위 카테고리 클릭시 링크로 이동 -->
                <section id="category">
                    <div id="#">홈</div>
                    <div id="lCategoryName">${itemList[0].LCategoryName}</div> 
                    <div id="mCategoryName"> ${itemList[0].MCategoryName}<div>
                </section>


                <section id="item-detail-head">
                
                    <c:if test="${fn:length(boardImageList) != null}">
                        <image id="item-image" src="${contextPath}${boardImageList[0].imageReName}"  alt="상품 이미지"></image>
                    </c:if>

                    <c:if test="${fn:length(boardImageList) == null}">
                        <image id="item-image" src="${contextPath}/resources/images/logo.png"  alt="상품 이미지"></image>
                    </c:if>
                    
                    <div id="item-info">
                        <div id="item-title">${itemList[0].boardTitle}</div>
                        <div id="item-price">${itemList[0].price}원</div>
                        <div id="item-layer">
                            <div id="bookmark"> 찜 : ${itemList[0].bookmarkCount} </div>
                            <div id="read-count"> 조회수 : ${itemList[0].readCount} </div>
                            <div id="create-DT">  ${itemList[0].updateDate} </div>
                            <div id="item-report">신고하기</div>
                        </div>

                        <div id="info-button-area">
                            <c:if test="${memberNo != loginMember.memberNo}"> 
                            
                                <button id="do-bookmark">찜하기</button> 
                                <%-- <p class="add-fav">
                                    <button type="button" class="add-fav-btn">찜하기</button>
                                </p> --%>
                                <button type="button" id="do-chat" onclick="location.href='${contextPath}/chat/start/${boardNo}/${memberNo}'">1:1 채팅하기</button>

                        
                            </c:if>
                        </div>

                        <%-- 모달창 --%>
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
                                    <button id="reportBtn">제출</button>
                                </div>
                                <div>
                                </div>
                            </div>
                        </div>

                        
                        <div id="item-condition">
                            
                            <span id="condition-detail">${itemList[0].itemCondition}</span>
                        </div>

                        <div id="item-delivery">
                            
                            <span id="delivery-detail">${itemList[0].tradeCondition}</span>
                        </div>

                        <div id="item-sell-area">
                            
                            <span id="sell-area-detail">${itemList[0].sellArea}</span>
                        </div>

                        
                        

                        
                    </div>
                    
                </section>


                <c:if test="${!empty sellList}">

                <div id="under-head">
                    <h3>판매자 다른 상품 보기</h3>
                    <a href="#"> - 전체보기</a>
                </div>

                <section id="seller-items">

                    <c:forEach var="sellList" items="${sellList}">
                        <div class="box">
                            <a href="${contextPath}/board/detail/${sellList.boardNo}" class="title">
                                <div class="image">
                                    <img src="${contextPath}${sellList.img.imageReName}"  class="img-other" alt="상품 이미지1">
                                </div>   
                                <div class="title1">
                                    <div class="title2">${sellList.boardTitle}</div>
                                    <div class="name2">
                                        <div class="price">${sellList.price}</div>
                                        <div class="time">${sellList.updateDate}</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>

                </c:if>

                 

                </section>

                <h3 id="body-info-head">상품 정보</h3>
                <section id="item-detail-body">
                    <div id="body-info">

                        <c:if test="${fn:length(boardImageList) != null}">

                            <!-- 업로드 이미지 영역 -->
                            <h5>상품 이미지</h5>
                            <div class="img-box">
                                <c:forEach var="i" begin="${start}" end="${fn:length(boardImageList) - 1}">
                                
                                    <div class="boardImg">
                                        <img src="${contextPath}${boardImageList[i].imageReName}">
                                    </div>

                                </c:forEach>
                            </div>

                        </c:if>        

                        
                        <div id="body-info-text">
                            ${itemList[0].boardContent}
                        </div>


                    </div>

                    <c:if test="${memberNo != loginMember.memberNo}">
                    <a href="${contextPath}/shop/memberShop/${memberNo}">
                    </c:if>

                    <c:if test="${memberNo == loginMember.memberNo}">
                    <a href="${contextPath}/shop/myShop/${loginMember.memberNo}">
                    </c:if>

                    
                        <div id="profile-box">
                                
                                <div id="profile-detail">
                                    <div id="profile-name">
                                        ${sellMember[0].memberNickname}
                                    </div>
                                    <div id="profile-podo">
                                        포도알 : ${sellMember[0].memberGrape}
                                    </div>
                        

                                </div>
                            <img id="profile-image" src="${contextPath}${sellMember[0].memberProfile}"  alt="회원 프로필 이미지">
                        </div>
                   
                    </a>
                    
                </section>

                <h3 id="foot-name">다른 추천 상품</h3>
                <div id="item-detail-foot">

                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="${contextPath}/resources/images/logo.png"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
    
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="${contextPath}/resources/images/logo.png"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
    
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="${contextPath}/resources/images/logo.png"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
    
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="${contextPath}/resources/images/logo.png"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
    
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="${contextPath}/resources/images/logo.png"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
    
                </div>

            </div>
            
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <%-- <script src="${contextPath}/resources/js/fav/heart.js"></script> --%>
    <script src="${contextPath}/resources/js/fav/arites.js"></script>
    <%-- 찜 버튼 JS --%>
    <script>
        const loginMemberNo = "${loginMember.memberNo}";
        const boardNo = "${boardNo}";

        const memberNo1= "${memberNo}";
    </script>
    <script src="${contextPath}/resources/js/modal.js"></script>
    
    
</body>
</html>