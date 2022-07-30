<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>podo</title>
    
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%-- 사이드메뉴 --%>
    <main>
        <div id="main-sideMenu">
        <div id="main-sideMenu1">
            <div id="go-topBtn">&#128070;<br>UP</div>
            <div id="recentShow-item">&#128064;<br>RECENT<br>ITEM</div>
            <div id="show-footer">DOWN<br>&#128071;</div>
        </div>
    </div>

    <!-- <%-- 모달창 --%> -->
    <div class="background">
        <div class="window">
            <div class="popup">
            <button id="close" type="button">팝업닫기</button>
            <div id="modal-text">최근 본 상품</div>
            <div id="modal-area"></div>
            </div>
            <div>
            </div>
        </div>
    </div>

	<div class="slide-list">
        <div class="mySlides"><img src="${contextPath}/resources/images/banner1-001.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner2-001.png"></div>
        <div class="mySlides"><img src="${contextPath}/resources/images/banner3-001.png"></div>
    </div>

        
        <div id="categoryName-space"></div><%-- main에서 ajax 받는 부분 --%> 
        
        <div id="mainName-space" >${param.mCategoryName}</div>

<%--         <div id="items-button-area">
            <button id="sales-items" type="button" class="showBtn">판매중인 상품만 보기</button>

        </div> --%>
    <section id="items-section">

        <div class="itmes">
            <h2 style="margin:0;">검색결과</h2>
        </div>
        <c:choose>
            <c:when test="${empty searchList}">

                <div>
                    <div class="frame">
                        
                        <!-- 게시글 목록 조회 결과가 비어있다면 -->
                        게시글이 존재하지 않습니다.
                    </div>
                </div>
            
            </c:when>
   
            <c:otherwise>

                <c:forEach var="item" items="${searchList}" begin="0" end="999" step="1" varStatus="vs">
               
                    <c:if test="${ vs.index % 5 eq 0}">
                        <div class="frame" >
                    </c:if>

                            <div class="box" id="${item.boardNo}">
                                <a href="${contextPath}/board/detail/${item.boardNo}"  class="title">
                                    <div class="image">
                                                <img src="${contextPath}${item.img.imageReName}"  alt="상품 이미지">
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
    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
    <!-- main.js 연결 -->
    <!-- <script src="${contextPath}/resources/js/detailList.js"></script> -->
    <script>
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
    </script>
    <script src="${contextPath}/resources/js/mainSideModal.js"></script>
    <script src="${contextPath}/resources/js/SdetailList.js"></script>

    <%-- <script>
         let contextPath = "${contextPath}";
    </script> --%>
</body>
</html>