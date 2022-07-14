<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="../../css/admin/InquiryPage.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

</head>

<header>
    <header>

        <link rel="stylesheet" href="../../css/header-style.css">
    
        <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
        
        <div id="top">
            <a href="#">로그인
            <a href="#">회원가입
            <a href="#">고객센터
        </div>
    
        <div id="header">
            <section id="menu"> 
                <i class="fa-solid fa-bars"></i>
                <a href="${contextPath}" >
                    <img src="../../images/logo.png" id="home-logo">
                </a>
            </section>
            
            <section class="mid-header">
                <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
            </section>
            <section class="right-header">
                <button class="button" onclick = "location.href = '${contextPath}/member-upload'"><i class="fa-solid fa-won-sign"></i>판매하기</button>
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-house-user"></i>내상점</button>   
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-message"></i>포도톡</button>
            </section>
        </div>
    </header>

</header>

<div class="top-menu">
    <nav id="mainMenu">
        <h3>1:1문의</h3>
    </nav>
</div>


<div class="option">
    <div class="select">
        <h4>분류</h4>
        <select>
            <option>운영정책</option>
            <option>계정/인증</option>
            <option>구매/판매</option>
            <option>본인인증</option>
        </select>
    </div>
    <form class="inquiry" action="#" method="post" id="inquiry">
    <div class="title">
        <div>
            <h4>제목</h4>
        </div>
        <div class="title1">
            <input id="title2" type="text" maxlength="60" placeholder="제목을 입력해주세요.">
        </div>

    </div>
</div>



<div>
    <form action="#" method="post" id="FAQ" name="FAQ">
        <div  class="box" >
          <textarea id="textarea" type="text" placeholder="문의내역을 입력해주세요."></textarea>    
        </div>
        <div id="photo">
            <input type="file" class="photo"><label for="photo"></label>
            <input type="file" class="photo"><label for="photo"></label>
            <input type="file" class="photo"><label for="photo"></label>
        </div>
        <div class="div1">
            <button type="submit" form="FAQ" id="submit">등록</button>
        </div>
    </form>
</div>
</form>


</body>
<footer>
    <link rel="stylesheet" href="../../css/footer-style.css">

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
	
    <div id="footer">
        <div id="footer1">
            <div class="frist">PODO(주) 사업자정보</div>
            <div>
                호스팅서비스 제공자 : 최강1팀
                <br>
                Email : help@podo.co.kr
                <br>
                주소 : 주소 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
                <br>
                (남대문로 1가 대일빌딩)
            </div>
            <div class="fifth">
                <a href="#">회사소개&nbsp|</a>
                <a href="#">이용약관&nbsp|</a>
                <a href="#">운영정책</a>
            </div>
        </div>

        <div id="footer2" >
            <div class="second">고객센터</div>
            <div class="third">02)9874-6541</div>
            <div>
            운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 13시 - 14시)
            </div>
            
                <div class="fourth">
                    <a href="#">공지사항&nbsp|</a>
                    <a href="#">1:1 문의사항&nbsp|</a>
                    <a href="#">자주 묻는 질문</a>
                </div>
        </div>
    </div>
</footer>
</html>