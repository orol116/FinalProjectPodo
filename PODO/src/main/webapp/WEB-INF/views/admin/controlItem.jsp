<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="itemList" value="${map.itemList}"/>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-controlItem</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/controlItem.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>

<header>
    <div id="header">
        <section id="menu"> 
            <a href="5" >
                <img src="${contextPath}/resources/images/logo.png" id="home-logo">
            </a>
            <div><h1>관리자 페이지</h1></div>
        </section>
    </div>    

</header>

<div class="top-menu">
    <nav id="mainMenu">
        <a href="5">회원관리</a>
        <a href="4">상품관리</a>
        <a href="3">1:1 문의</a>
        <a href="6">신고관리</a>
    </nav>
    <nav id="mainMenu2">
        <a href="7">자주 묻는 질문(FAQ)</a>
    </nav>
</div>

<form action="${item.boardNo}" method="get" id="itemSearch" onsubmit="return searchValidate()">

    <div class="option">
        <select name="key" id="search-key">
            <option value="all">판매상태</option>
            <option value="s">판매 중</option>
            <option value="r">예약 중</option>
            <option value="e">판매완료</option>
        </select>
    
        <section class="basic">
                <input id="search2" type="text" name="query" placeholder="상품명을 입력해주세요.">
                <button class="button" type= "submit" id="searchItem" ><i class="fa-solid fa-magnifying-glass"></i></button>
        </section>
    </div>
</form>


<form class="search1" action="#" id="search"  name="list-form" onsubmit="return ckBox()">

<div>
    <table>
        <thead>
            <tr id="head">
                <th>선택</th>
                <th>번호</th>
                <th>분류</th>
                <th>상품명</th>
                <th>가격</th>
                <th>판매지역</th>
                <th>찜 갯수</th>
                <th>등록일</th>
                <th>상품 상태</th>
                <th>판매상태</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                    <c:when test ="${empty itemList}">
                        <tr>
                            <th colspan="5">아이템이 존재하지 않습니다.</th>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="item" items="${itemList}">
                            <tr>
                            <td><input type="checkbox" name="itemList" id="chkbox" value="${{item.boardNo}}"></td>
                                <td >${item.boardNo}</td>
                                <td >${item.categoryName}</td>
                                <td><a href="../board/detail/${item.boardNo}">${item.boardTitle}</a></td>
                                <td >${item.price}</td>
                                <td >${item.sellArea}</td>
                                <td >${item.bookmarkCount}</td>
                                <td >${item.createDate}</td>
                                <td>${item.itemCondition}</td>
                                <td>${item.tradeCondition}</td>
                            </tr>    
                        </c:forEach>      
                    </c:otherwise>
            </c:choose>

        </tbody>
    </table>
    
    <div class="last">
        <div>
            <label for="checkbox"><input type="checkbox" id="checkbox" value='selectall' onclick='selectAll(this)'>전체선택</label>
        </div>
        <div>
            <button type="submit" class="btn" id="deleteBtn" >삭제</button>
        </div>
    </div>
    <input type="hidden" name="deleteNo" id="deleteNo" value="">
</form>

    <div class="pagination">
       <c:set var="url" value="4?cp="/>

            <ul class="pagination">
                <!-- 첫 페이지로 이동 -->
                <li><a href="${url}1${sURL}">&lt;&lt;</a></li>

                <!-- 범위가 정해진 일반 for문 사용 -->
                <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">

                    <c:choose>
                        <c:when test="${i == pagination.currentPage}">
                            <li><a class="current">${i}</a></li>
                        </c:when>

                        <c:otherwise>
                            <li><a href="${url}${i}${sURL}">${i}</a></li>        
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
                

                <!-- 끝 페이지로 이동 -->
                <li><a href="${url}${pagination.maxPage}${sURL}">&gt;&gt;</a></li>

            </ul>

    </div>
    <script src="${contextPath}/resources/js/admin/controlItem.js"></script>


</div>
</body>
</html>