<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
            <a href="main" >
                <img src="${contextPath}/resources/images/logo.png" id="home-logo">
            </a>
            <div><h1>관리자 페이지</h1></div>
        </section>
    </div>    

</header>

<div class="top-menu">
    <nav id="mainMenu">
        <a href="#">회원관리</a>
        <a href="#">상품관리</a>
        <a href="#">1:1 문의</a>
        <a href="#">신고관리</a>
    </nav>
    <nav id="mainMenu2">
        <a href="#">자주 묻는 질문(FAQ)</a>
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
            <tr>
                <td><input type="checkbox"></td>
                <td>1</td>
                <td>광고</td>
                <td>상점 및 사이트 홍보</td>
                <td>홍길동</td>
                <td>2022-06-30 18:07</td>
            </tr>    
             <tr>
                <td><input type="checkbox"></td>
                <td>2</td>
                <td>상품 정보 부정확</td>
                <td>가격 신고 합니다</td>
                <td>김영희</td>
                <td>2022-07-12 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>3</td>
                <td>거래 금지 품목</td>
                <td>가품(위조품/이미테이션)</td>
                <td>이영수</td>
                <td>2022-07-12 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>4</td>
                <td>사기의심(외부채널 유도)</td>
                <td>내용 textarea</td>
                <td>강영환</td>
                <td>2022-07-12 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>5</td>
                <td>기타(사유)</td>
                <td>내용 textarea </td>
                <td>박예준</td>
                <td>2022-07-12 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>6</td>
                <td>광고 (상점 및 타사이트 홍보, 상품도배)</td>
                <td>상품 도배</td>
                <td>박서준</td>
                <td>2022-07-28 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>7</td>
                <td>구매/판매</td>
                <td>택배로 받기를 원할 때, 예상 배송 기간 문의</td>
                <td>박서준</td>
                <td>2022-07-28 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>8</td>
                <td>상품 정보 부정확</td>
                <td>내용 textarea</td>
                <td>곽민수</td>
                <td>2022-07-28 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>9</td>
                <td>거래 금지 품목</td>
                <td>반려동물(분양/입양 글)</td>
                <td>사하준</td>
                <td>2022-07-28 03:07</td>
            </tr>  
            <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td>거래 금지 품목</td>
                <td>조건부 무료나눔</td>
                <td>곽민수</td>
                <td>2022-07-28 03:07</td>
            </tr>  

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