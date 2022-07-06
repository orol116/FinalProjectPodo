<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    


<script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
<header>
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
                <img src="resources/images/logo.png" id="home-logo">
            </a>
        </section>
        
        <div class="mid-header">
            <input id="search2" type="text" placeholder="상품명 입력">
            <a id="button"><i class="fa-solid fa-magnifying-glass"></i></a>
        </div>
        <div class="right-header">
            <i class="fa-regular fa-bell" href="#"></i>
            <i class="fa-regular fa-basket-shopping" href="#"></i>      
            <i class="fa-regular fa-message" href="#"></i>
        </div>
    </div>
</header>
	
