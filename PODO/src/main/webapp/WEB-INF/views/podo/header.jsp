<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    


<script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
<header>
	<!-- 클릭 시 메인페이지로 이동하는 로고 -->
	<section class="top">
        
    </section>
    <section class="left-header">
        <i class="fa-solid fa-bars"></i>
        <a href="main">
            <img src="${contextPath}/resources/images/logo.png" id="home-logo">
        </a>
    </section>
    <section class="mid-header">
        <div>
            <input type="text" placeholder="검색어 입력">
            <button><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        <div  class="right-header">
            <i class="fa-regular fa-bell"></i>
            <i class="fa-regular fa-basket-shopping"></i>      
            <i class="fa-regular fa-message"></i>
        </div>
    </section>
    

</header>
	
