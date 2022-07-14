<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pagination" value="${map.pagination}"/>
<c:set var="reportList" value="${map.reportList}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-신고관리</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/controlReport.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

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


<div class="option">
    <select>
        <option>신고사유</option>
        <option>광고</option>
        <option>상품 정보 부정확</option>
        <option>거래 금지 품목</option>
        <option>허위 매물</option>
        <option>사기 의심</option>
        <option>기타</option>
    </select>
 
   
    <section class="basic">
        <form class="search1" action="#" method="post" id="search">
            <input id="search2" type="text" placeholder="신고글 사유를 입력해주세요.">
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    </section>
</div>



<div>
    <table>
        <thead>
            <tr id="head">
                <th><input type="checkbox"></th>
                <th>번호</th>
                <th>분류</th>
                <th>사유</th>
                <th>작성자</th>
                <th>신고일</th>
      
            </tr>
        </thead>

        <tbody>
            
             <c:choose>
                    <c:when test ="${empty reportList}">
                        <tr>
                            <th colspan="5">게시글이 존재하지 않습니다.</th>
                        </tr>
                    </c:when>

                    <c:otherwise>
                        <c:forEach var="report" items="${reportList}">
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>${report.boardNo}</td>
                                <td>${report.classification}</td>
                                <td>${report.boardContent}</td>
                                <td>${report.memberNick}</td>
                                <td>${report.createDate}</td>
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
           
            <button id="delete">삭제</button>
        </div>
    </div>

    <div class="pagination">
       <c:set var="url" value="6?cp="/>


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

</div>
</body>
</html>