<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/member/find-IDPW.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/confirmId.css">
    

    <title>아이디 찾기</title>
</head>


<body>
    <main>

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div id="contaioner">
            
            <h3>아이디 찾기</h3>
                <fieldset id="comfirm_id">
                    <span id="an_message">고객님의 정보와 일치하는 아이디 목록입니다.</span>
                    <section id="confirm_area">
                        <div class="id_box">
                            <ul class="id_list">
                                <c:forEach var="findMember" items="${findMemberList}">
                                    <li>
                                        <strong name="${findMember.memberId}">${findMember.memberId}</strong>
                                        <span id="an_createDt">가입 : ${findMember.createDate}</span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="btn_area">
                            <button id="login_btn" onclick="location.href = '${contextPath}/member/login'">로그인하기</button>
                            <button id="findPw_btn" onclick="location.href = '${contextPath}/member/myPage/inputPw'">비밀번호 찾기</button>
                        </div>
                    </section>
                </fieldset>
        </div>            

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
     

        <script src="${contextPath}/resources/js/member/findID.js"></script> 


    </main>

    
</body>
</html>
