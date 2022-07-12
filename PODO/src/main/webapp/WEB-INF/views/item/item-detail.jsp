<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="itemList" value="${map.itemList}" />
<c:set var="memberNo" value="${map.memberNo}" />

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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

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
                    <a href="#">홈</a> >
                    <a href="#">대분류</a> >
                    <a href="#">중분류</a>
                </section>


                <section id="item-detail-head">
                    <image id="item-image" src="${contextPath}/resources/images/logo.png"  alt="상품 이미지"></image>
                    <div id="item-info">
                        <div id="item-title">${itemList.boardTitle}</div>
                        <div id="item-price">${itemList.price}원</div>
                        <div id="item-layer">
                            <div id="bookmark"> 찜 : ${itemList.bookmarkCount} </div>
                            <div id="read-count"> 조회수 : ${itemList.readCount} </div>
                            <div id="create-DT">  ${itemList.updateDate} </div>
                            <a href="#" id="item-report">신고하기</a>
                        </div>

                        
                        <div id="item-condition">
                            
                            <span id="condition-detail">미개봉</span>
                        </div>

                        <div id="item-delivery">
                            
                            <span id="delivery-detail">배송비 별도</span>
                        </div>

                        <div id="item-sell-area">
                            
                            <span id="sell-area-detail">서울시 중구</span>
                        </div>

                        <div id="info-button-area">
                            <button id="do-bookmark">찜하기</button>
                            <button id="do-chat">1:1 채팅하기</button>
                        </div>
                    </div>
                    
                </section>

                <div id="under-head">
                    <h3>판매자 다른 상품 보기</h3>
                    <a href="#"> - 전체보기</a>
                </div>

                <section id="seller-items">

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
                            <div class="image ">
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


                </section>

                <h3 id="body-info-head">상품 정보</h3>
                <section id="item-detail-body">
                    <div id="body-info">
                        
                        <div id="body-info-text">
                            상세 상세 상세 상세 상세
                           

                        </div>


                    </div>

                    <div id="body-profile-area">
                        <div id="profile-box">
                            <div id="profile-detail">
                                <div id="profile-name">
                                    이원석
                                </div>
                                <div id="profile-podo">
                                    100개
                                </div>
                     

                            </div>

                            <img id="profile-image" src="${contextPath}/resources/images/logo.png"  alt="회원 프로필 이미지">
                        </div>

                        <div id="review-text">후기</div>
                        <div id="profile-review">
                            <div class="review">
                                친절합니다
                            </div>

                            <div class="review">
                                불친절합니다
                            </div>

                        </div>

                    </div>
                    
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

    
</body>
</html>