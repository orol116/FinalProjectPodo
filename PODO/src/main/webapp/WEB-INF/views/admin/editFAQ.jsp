<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adiminPage-자주묻는질문(FAQ)수정</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/editFAQ.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>

<header>
    <div id="header">
        <section id="menu"> 
            <a href="../5" >
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

<form class="faq" action="${contextPath}/admin/7/write" method="post" id="faq">

    <div class="option">
        <div class="select">
            <h4>분류</h4>
            <select name="classification">
                <option>운영정책</option>
                <option>회원/인증</option>
                <option>구매/판매</option>
                <option>이용방법</option>
            </select>
        </div>
    </div>

    
    <div class="title">
        <h4>제목</h4>
        <div class="title1">
            <input id="title2" type="text" maxlength="60" placeholder="제목을 입력해주세요." name="boardTitle">
        </div>
    </div>



    <div class="box">
            <textarea id="textarea" type="text" placeholder="수정내용을 입력해주세요." name="boardContent"></textarea>    
            <div class="div1">
                <button class="sumbit">등록</button>
            </div>
    </div>
</form>


</body>
</html>