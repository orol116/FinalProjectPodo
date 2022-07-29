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
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
</head>

<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%-- 사이드메뉴 --%>
    <main style="margin-top: 20px;">
        <div id="main-sideMenu">
        <div id="main-sideMenu1">
            <div id="go-topBtn">&#128070;<br>TOP</div>
        </div>
    </div>

   <div class="slide-list">
        <div class="mySlides"><img src="${contextPath}/resources/images/banner1-001.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner2-001.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner3-001.png"></div>
    </div>
        

<%--         <div id="items-button-area">
            <button id="sales-items" type="button" class="showBtn">판매중인 상품만 보기</button>

        </div> --%>
    
    
    <section id="categoryDelete-section">
        <section id="items-readCount-section">
            
        <div class="itmes">
            <a href="${contextPath}/main/mainReadCount" style="color: #000;"><h2 style="margin:0;">조회수가 높은 상품을 추천드려요 ></h2></a>
        </div>
        <c:choose>
            <c:when test="${empty readCountList}">

                <div>
                    <div class="frame">
                        
                        <!-- 게시글 목록 조회 결과가 비어있다면 -->
                        게시글이 존재하지 않습니다.
                    </div>
                </div>
            
            </c:when>
   
            <c:otherwise>

                <c:forEach var="item" items="${readCountList}" begin="0" end="9" step="1" varStatus="vs">
               
                    <c:if test="${ vs.index % 5 eq 0}">
                        <div class="frame" >
                    </c:if>

                            <div class="box" id="${item.boardNo}">
                                <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                    <div class="image">
                                        <c:choose>

                                            <c:when test="${!empty item.img.imageReName}">

                                                <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">

                                            </c:when>

                                            <c:otherwise>

                                                <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>   
                                    
                                    <div class="title1">
                                        <div class="name1">
                                            <div class="title2">${item.boardTitle}</div>
                                            <c:set var="name" value="${item.delivery}"/>
                                            <c:if test ="${name eq '무료배송'}">
                                                <div class="delivery">${item.delivery}</div>
                                            </c:if>
                                            <c:set var="name" value="${item.tradeCondition}"/>
                                            <c:if test ="${name eq '판매완료'}">
                                                <div class="tradeCondition">${item.tradeCondition}</div>
                                            </c:if>
                                        </div>
                                        <div class="name2">
                                            <div class="price">${item.price}원</div>
                                            <div class="time">${item.updateDate}</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                          
                    <c:if test="${ vs.index % 5 eq 4}">

                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <section id="items-podo-section">

            <div class="itmes">
                <a href="${contextPath}/main/mainPodo" style="color: #000;"> <h2 style="margin:0;">포도를 많이 가진 회원의 상품을 추천드려요 ></h2></a>
            </div>
            <c:choose>
                <c:when test="${empty podoList}">

                    <div>
                        <div class="frame">
                            
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </div>
                    </div>
                
                </c:when>
    
                <c:otherwise>

                    <c:forEach var="item" items="${podoList}" begin="0" end="9" step="1" varStatus="vs">
                
                        <c:if test="${ vs.index % 5 eq 0}">
                            <div class="frame" >
                        </c:if>

                                <div class="box" id="${item.boardNo}">
                                    <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                        <div class="image">
                                            <c:choose>

                                                <c:when test="${!empty item.img.imageReName}">

                                                    <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">

                                                </c:when>

                                                <c:otherwise>

                                                    <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>   
                                        
                                        <div class="title1">
                                            <div class="name1">
                                                <div class="title2">${item.boardTitle}</div>
                                                <c:set var="name" value="${item.delivery}"/>
                                                <c:if test ="${name eq '무료배송'}">
                                                    <div class="delivery">${item.delivery}</div>
                                                </c:if>
                                                <c:set var="name" value="${item.tradeCondition}"/>
                                                <c:if test ="${name eq '판매완료'}">
                                                    <div class="tradeCondition">${item.tradeCondition}</div>
                                                </c:if>
                                            </div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                        <c:if test="${ vs.index % 5 eq 4}">
                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <section id="items-freeShop-section">
            
            <div class="itmes">
                <a href="${contextPath}/main/mainFreeShop" style="color: #000;"> <h2 style="margin:0;">무료배송 상품을 추천드려요 ></h2></a>
            </div>
            <c:choose>
                <c:when test="${empty freeShopList}">

                    <div>
                        <div class="frame">
                            
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </div>
                    </div>
                
                </c:when>
    
                <c:otherwise>


                    <c:forEach var="item" items="${freeShopList}" begin="0" end="9" step="1" varStatus="vs">
                
                        <c:if test="${ vs.index % 5 eq 0}">
                            <div class="frame" >
                        </c:if>

                                <div class="box" id="${item.boardNo}">
                                    <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                        <div class="image">
                                            <c:choose>

                                                <c:when test="${!empty item.img.imageReName}">

                                                    <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">
                                                </c:when>

                                                <c:otherwise>

                                                    <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>   
                                        
                                        <div class="title1">
                                            <div class="name1">
                                                <div class="title2">${item.boardTitle}</div>
                                                <c:set var="name" value="${item.delivery}"/>
                                                <c:if test ="${name eq '무료배송'}">
                                                    <div class="delivery">${item.delivery}</div>
                                                </c:if>
                                                <c:set var="name" value="${item.tradeCondition}"/>
                                                <c:if test ="${name eq '판매완료'}">
                                                    <div class="tradeCondition">${item.tradeCondition}</div>
                                                </c:if>
                                            </div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                        <c:if test="${ vs.index % 5 eq 4}">
                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <section id="items-podo-section">

            <div class="itmes">
                <a href="${contextPath}/main/mainPodo" style="color: #000;"> <h2 style="margin:0;">포도를 많이 가진 회원의 상품을 추천드려요 ></h2></a>
            </div>
            <c:choose>
                <c:when test="${empty podoList}">

                    <div>
                        <div class="frame">
                            
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </div>
                    </div>
                
                </c:when>
    
                <c:otherwise>

                    <c:forEach var="item" items="${podoList}" begin="0" end="9" step="1" varStatus="vs">
                
                        <c:if test="${ vs.index % 5 eq 0}">
                            <div class="frame" >
                        </c:if>

                                <div class="box" id="${item.boardNo}">
                                    <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                        <div class="image">
                                            <c:choose>

                                                <c:when test="${!empty item.img.imageReName}">

                                                    <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">

                                                </c:when>

                                                <c:otherwise>

                                                    <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>   
                                        
                                        <div class="title1">
                                            <div class="name1">
                                                <div class="title2">${item.boardTitle}</div>
                                                <c:set var="name" value="${item.delivery}"/>
                                                <c:if test ="${name eq '무료배송'}">
                                                    <div class="delivery">${item.delivery}</div>
                                                </c:if>
                                                <c:set var="name" value="${item.tradeCondition}"/>
                                                <c:if test ="${name eq '판매완료'}">
                                                    <div class="tradeCondition">${item.tradeCondition}</div>
                                                </c:if>
                                            </div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                        <c:if test="${ vs.index % 5 eq 4}">
                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <section id="items-freeShop-section">
            
            <div class="itmes">
                <a href="${contextPath}/main/mainFreeShop" style="color: #000;"> <h2 style="margin:0;">무료배송 상품을 추천드려요 ></h2></a>
            </div>
            <c:choose>
                <c:when test="${empty freeShopList}">

                    <div>
                        <div class="frame">
                            
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </div>
                    </div>
                
                </c:when>
    
                <c:otherwise>


                    <c:forEach var="item" items="${freeShopList}" begin="0" end="9" step="1" varStatus="vs">
                
                        <c:if test="${ vs.index % 5 eq 0}">
                            <div class="frame" >
                        </c:if>

                                <div class="box" id="${item.boardNo}">
                                    <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                        <div class="image">
                                            <c:choose>

                                                <c:when test="${!empty item.img.imageReName}">

                                                    <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">
                                                </c:when>

                                                <c:otherwise>

                                                    <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>   
                                        
                                        <div class="title1">
                                            <div class="name1">
                                                <div class="title2">${item.boardTitle}</div>
                                                <c:set var="name" value="${item.delivery}"/>
                                                <c:if test ="${name eq '무료배송'}">
                                                    <div class="delivery">${item.delivery}</div>
                                                </c:if>
                                                <c:set var="name" value="${item.tradeCondition}"/>
                                                <c:if test ="${name eq '판매완료'}">
                                                    <div class="tradeCondition">${item.tradeCondition}</div>
                                                </c:if>
                                            </div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                        <c:if test="${ vs.index % 5 eq 4}">
                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <section id="items-unOpen-section">

            <div class="itmes">
                
                <a href="${contextPath}/main/mainUnOpen" style="color: #000;"> <h2 style="margin:0;">미개봉 상품을 추천드려요 ></h2></a>
            </div>

            <c:choose>
                <c:when test="${empty unOpenList}">

                    <div>
                        <div class="frame">
                            
                            <!-- 게시글 목록 조회 결과가 비어있다면 -->
                            게시글이 존재하지 않습니다.
                        </div>
                    </div>
                
                </c:when>
    
                <c:otherwise>

                    <c:forEach var="item" items="${unOpenList}" begin="0" end="9" step="1" varStatus="vs">
                
                        <c:if test="${ vs.index % 5 eq 0}">
                            <div class="frame" >
                        </c:if>

                                <div class="box" id="${item.boardNo}">
                                    <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                        <div class="image">
                                            <c:choose>

                                                <c:when test="${!empty item.img.imageReName}">

                                                    <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">

                                                </c:when>

                                                <c:otherwise>

                                                    <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>   
                                        
                                        <div class="title1">
                                            <div class="name1">
                                                <div class="title2">${item.boardTitle}</div>
                                                <c:set var="name" value="${item.delivery}"/>
                                                <c:if test ="${name eq '무료배송'}">
                                                    <div class="delivery">${item.delivery}</div>
                                                </c:if>
                                                <c:set var="name" value="${item.tradeCondition}"/>
                                                <c:if test ="${name eq '판매완료'}">
                                                    <div class="tradeCondition">${item.tradeCondition}</div>
                                                </c:if>
                                            </div>
                                            <div class="name2">
                                                <div class="price">${item.price}원</div>
                                                <div class="time">${item.updateDate}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            
                        <c:if test="${ vs.index % 5 eq 4}">
                            </div>
                        </c:if>
                        
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </section>

        <!-- 내 주변 상품 -->
        <div class="itmes">
                    
            <a href="${contextPath}/main/mainLocation" style="color: #000;"> <h2 style="margin:0;">내 주변 상품을 추천드려요 ></h2></a>
        </div>
        <section id="items-location-section">
            
        </section>
        
    </section>
        <!-- 카테고리 상품 -->

         <!-- 카테고리 상품 -->
    <div class="itmes">
        <a > <h2 style="margin:0;" id="category-header-a">${param.mCategoryName} 카테고리 ></h2></a>
    </div>
    

    <section>


       <section id="items-section" style="display:none;">

                <c:choose>
            <c:when test="${empty itemList}">

                <div class="itmes">
                    <a href="${contextPath}/main/mainReadCount"><h2 style="margin:0;">조회수가 높은 상품을 추천드려요 ></h2></a>
                </div>
            </c:when>
        
            <c:when test="${empty readCountList}">


                <div>
                    <div class="frame">
                        
                        <!-- 게시글 목록 조회 결과가 비어있다면 -->
                        게시글이 존재하지 않습니다.
                    </div>
                </div>
            
            </c:when>

            <c:otherwise>

                <c:forEach var="item" items="${readCountList}" begin="0" end="9" step="1" varStatus="vs">
                
                    <c:if test="${ vs.index % 5 eq 0}">
                        <div class="frame" >
                    </c:if>

                            <div class="box" id="${item.boardNo}">
                                <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                    <div class="image">
                                        <c:choose>

                                            <c:when test="${!empty item.img.imageReName}">

                                                <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">

                                            </c:when>

                                            <c:otherwise>

                                                <img src="resources/images/items/image1.jpg"  alt="상품 이미지">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>   
                                    
                                    <div class="title1">
                                        <div class="name1">
                                            <div class="title2">${item.boardTitle}</div>
                                            <div class="state">${item.tradeCondition}</div>
                                        </div>
                                        <div class="name2">
                                            <div class="price">${item.price}원</div>
                                            <div class="time">${item.updateDate}</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            
                    <c:if test="${ vs.index % 5 eq 4}">
                        </div>
                    </c:if>
                    
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </section>

        

       

    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />



    <script>
            // 자동 배너 슬라이드 효과

            var slideIndex = 0;
            carousel();

            function carousel() {
                var i;
                var x = document.getElementsByClassName("mySlides");
                for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > x.length) {slideIndex = 1}
                x[slideIndex-1].style.display = "block";
                
                setTimeout(carousel, 5000); // Change image every 2 seconds
            }

            var mCatName = "${param.mCategoryName}"
    </script>
    <!— jQuery 라이브러리 추가 —>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
    <!— main.js 연결 —>
    <script src="${contextPath}/resources/js/main.js"></script>
    <script src="${contextPath}/resources/js/mainSideModal.js"></script>

</body>
</html>