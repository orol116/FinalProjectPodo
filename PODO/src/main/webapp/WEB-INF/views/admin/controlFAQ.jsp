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
        <section>
            <a id="logout" href="#">로그아웃</a>
            <a id="gotoMain" href="${contextPath}">메인으로</a>
        </section>
    </div>    

</header>

<%-- 검색을 진행한 경우 key, query를 쿼리스트링 형태로 저장한 변수 생성 --%>
    <c:if test="${!empty param.key}">
        <c:set var="sURL" value="&key=${param.key}&query=${param.query}" />
    </c:if>

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

<form  class="search1" action="7" method="get" id="reportSearch" onsubmit="return searchValidate()">
    <div class="option">
        <select name="key" id="search-key">
            <option value="1">운영정책</option>
            <option value="2">계정/인증</option>
            <option value="3">구매/판매</option>
            <option value="4">본인인증</option>
        </select>
    
        <section class="basic">
                <input id="search2" type="text" name="query" placeholder="1:1문의 글의 제목을 입력해주세요.">
                <button class="button" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
        </section>
    </div>
</form>

<form class="search1" action="controlFAQ" id="search"  name="list-form" onsubmit="return ckBox()">
    <div>
        <table>
            <thead>
                <tr id="head">
                    <th>선택</th>
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
                                    <td><input type="checkbox" name="FAQList" id="chkbox" value="${faq.boardNo}"></td>
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
                <label for="checkbox"><input type="checkbox" id="checkbox" value='selectall' onclick='selectAll(this)'>전체선택</label>
            </div>
            <div>
                <button id="write" onclick="location.href='${contextPath}/admin/7/write'">글쓰기</button>
                <button type="submit" class="btn" id="deleteBtn">삭제</button>
            </div>
        </div>
</form>

      <div class="pagination">
          <c:set var="url" value="7?cp="/>
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

            <%-- <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">&raquo;</a> --%>
        </div>

    </div>

    <script src="${contextPath}/resources/js/admin/controlFAQ.js"></script>

</body>
</html>