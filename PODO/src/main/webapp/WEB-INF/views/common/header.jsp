<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    


    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/header-style.css">
    
<header>
    <div id="top">
            <a href="${contextPath}/member-login">로그인
            <a href="${contextPath}/signUp">회원가입
            <a href="#">고객센터
    </div>

    <div id="header">
        <section id="menu"> 
            <i class="fa-solid fa-bars"></i>
            <a href="${contextPath}" >
                <img src="resources/images/logo.png" id="home-logo">
            </a>
        </section>
        
        <section class="mid-header">
            <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
        </section>
        <section class="right-header">
            <button class="button" onclick = "location.href = '${contextPath}/member-upload'"><i class="fa-solid fa-won-sign" ></i>판매하기</button>
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-house-user"></i>내상점</button>   
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-message"></i>포도톡</button>
        </section>
    </div>
</header>
	
