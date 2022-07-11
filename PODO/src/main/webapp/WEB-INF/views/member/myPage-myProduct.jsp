<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매상품관리 페이지</title>

    <link rel="stylesheet" href="resources/css/main-style.css">
    <link rel="stylesheet" href="resources/css/member/myPage-myProduct.css">
    <link rel="stylesheet" href="resources/css/member/sideMenu.css">
    

</head>
<body>
    <main>

        <%-- header --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

        <!-- 사이드 메뉴 -->
        <jsp:include page="/WEB-INF/views/member/sideMenu.jsp" />

        <!-- 본문 상품 조회 영역 -->
        <div class="myPage-inner">

            <!-- 상단 메뉴 -->
            <div class="menu">
                <nav class="menuOption">
                    <div class="">
                        <a class="" href="#">상품등록</a>
                    </div>
                    <div class="">
                        <a class="" href="#">상품관리</a>
                    </div>
                    <div class="">
                        <a href="#" target="_blank" class="">구매한 내역</a>
                    </div>
                </nav>
            </div>

            <!-- 본문 -->
            <main class="myPage-main">

                <header class="option">

                    <form class="optionForm">
                        <input type="text" placeholder="상품명을 입력해주세요." value="">
                        <button type="submit" class="searchButton"></button>
                    </form>

                    <!-- n개씩 -->

                    <!-- 전체/판매중/예약중/판매완료  -->
                    
                </header>
                <table>
                    <thead>
                        <tr>
                            <th>사진</th>
                            <th>판매상태</th>
                            <th>상품명</th>
                            <th>가격</th>
                            <th>찜/댓글</th>
                            <th>최근수정일</th>
                            <th>기능</th>
                        </tr>
                    </thead>

                    <tbody>
                    </tbody>

                </table>
            </main>
        </div>
  


    </main>

     <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
</body>
</html>