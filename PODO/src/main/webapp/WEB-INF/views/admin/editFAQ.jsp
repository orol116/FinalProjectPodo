<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-자주묻는질문(FAQ)수정</title>

    <link rel="stylesheet" href="../../css/admin/editFAQ.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

</head>

<header>
    <div id="header">
        <section id="menu"> 
            <a href="main" >
                <img src="../../images/logo.png" id="home-logo">
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
    <div class="select">
        <h4>분류</h4>
        <select>
            <option>운영정책</option>
            <option>계정/인증</option>
            <option>구매/판매</option>
            <option>본인인증</option>
        </select>
    </div>
<form class="faq" action="#" method="post" id="faq">
   
    <div class="title">
        <h4>제목</h4>
        <div class="title1">
            <input id="title2" type="text" maxlength="60" placeholder="제목을 입력해주세요.">
        </div>
        
    </div>
</div>



<div class="box">
    <form action="#" method="post" id="FAQ" name="FAQ">
        <textarea id="textarea" type="text" placeholder="수정내용을 입력해주세요."></textarea>    
        <div class="div1">
            <button class="sumbit">등록</button>
        </div>
    </form>
</div>
</form>


</body>
</html>