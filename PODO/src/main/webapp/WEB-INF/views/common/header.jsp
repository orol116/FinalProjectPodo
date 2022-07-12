<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    


<script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/header-style.css"> 
<header>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>

    <script>
        const category = document.getElementById("fa-bars");

        area = document.getElementById("category-area");

        category.addEventListener("mouseenter", function(){

            area.style.display = "flex";

        });

        area.addEventListener("mouseleave", function(){

            area.style.display = "none";

        });
    
    
    </script>
    
    <div id="top">
    <c:choose>
        <c:when test="${empty loginMember}">
                <a href="${contextPath}/member/login">로그인
                <a href="${contextPath}/member/signUp">회원가입
        </c:when>
        <c:otherwise>
                <a href="${contextPath}/member/login">로그아웃
                <a href="${contextPath}/member/myPage/changePw">마이페이지
        </c:otherwise>
    </c:choose>    
       
    </div>

    <div id="header">
        <section id="menu"> 
            <i class="fa-solid fa-bars"></i>
            <a href="${contextPath}" >
                <img src="${contextPath}/resources/images/logo.png" id="home-logo">
            </a>
        </section>
        
        <section class="mid-header">

            <!-- <form action="$[contextPath}" method="get" id="boardSerch" onclick="return searchValidate()"> -->
                <input id="search2" type="text" name="searchBar" placeholder="상품명을 입력해주세요.">
                <button class="button"><i class="fa-solid fa-magnifying-glass"></i></button>
            <!-- </form> -->

        </section>
        <section class="right-header">
            <button class="button" onclick = "location.href = '${contextPath}/member/itemUpload'"><i class="fa-solid fa-won-sign" ></i>판매하기</button>

            <button class="button" onclick = "location.href = '${contextPath}/shop/myShop'"><i class="fa-solid fa-house-user"></i>내 상점</button>

            <button class="button" onclick = "location.href = '${contextPath}/member/podoTalk'"><i class="fa-solid fa-message"></i>포도톡</button>
        </section>
        <div id="category-area">
        <ul id="item-category">
            <li class="category-name" href="#" id="zzzz">
                전체 카테고리
            </li>

            <li class="category-name" href="#">
                인기매물
            </li>

            <li class="category-name" href="#">
                생활가전
            </li>

            <li class="category-name" href="#">
                남성의류
            </li>

            <li class="category-name" href="#">
                여성의류
            </li>

            <li class="category-name" href="#">
                전자기기(디지털기기)
            </li>

            <li class="category-name" href="#">
                가구/ 인테리어
            </li>

            <li class="category-name" href="#">
                도서 /티켓/ 음반
            </li>

            <li class="category-name" href="#">
                식품
            </li>

            <li class="category-name" href="#">
                식물
            </li>

            <li class="category-name" href="#">
                스포츠/ 레저
            </li>

            <li class="category-name" href="#">
                뷰티/ 미용
            </li>

            <li class="category-name" href="#">
                게임취미
            </li>
            
            <li class="category-name" href="#">
                삽니다
            </li>
        </ul>


        <ul id="div-category">
            <li>1</li>
            <li>2</li>
            <li>3</li>
            <li>4</li>
            <li>5</li>

        </ul>
    </div>

    <!-- ------------------------------------------------------- -->

    </div>
</header>
   