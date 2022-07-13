<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/InquiryPage.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

</head>



<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

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



    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>