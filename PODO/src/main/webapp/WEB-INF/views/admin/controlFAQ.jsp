<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="FAQList" value="${map.FAQList}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-자주묻는질문(FAQ)</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/controlFAQ.css">
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


<form class="search1" action="7" method="get" id="search">

    <div class="option">
        <select name="key" id="search-key">
            <option value="1">운영정책</option>
            <option value="2">계정/인증</option>
            <option value="3">구매/판매</option>
            <option value="4">본인인증</option>
        </select>
    
        <section class="basic">
                <input id="search2" type="text" name="query" placeholder="1:1문의 글의 제목을 입력해주세요.">
                <button class="button"><i class="fa-solid fa-magnifying-glass"></i></button>
        </section>
    </div>
</form>



<div>
    <table>
        <thead>
            <tr id="head">
                <th><input type="checkbox"></th>
                <th>번호</th>
                <th>분류</th>
                <th>제목</th>
                <th>작성자</th>
                <th>등록일</th>
      
            </tr>
        </thead>
        <tbody>
             <c:choose>
                    <c:when test ="${empty FAQList}">
                        <tr>
                            <th colspan="5">게시글이 존재하지 않습니다.</th>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="faq" items="${FAQList}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${faq.boardNo}</td>
                                <td>${faq.classification}</td>
                                <td>${faq.boardTitle}</td>
                                <td>${faq.memberNick}</td>
                                <td>${faq.createDate}</td>
                            </tr>    
                        </c:forEach>      
                    </c:otherwise>
            </c:choose>
        </tbody>
    </table>
    
    <div class="last">
        <div>
            <input type="checkbox" id="checkbox"><label for="checkbox"> 전체선택</label>
        </div>
        <div>
            <button id="write" onclick="location.href='${contextPath}/admin/7/write'">글쓰기</button>
            <button id="delete">삭제</button>
        </div>
    </div>

    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </div>

</div>
</body>
</html>