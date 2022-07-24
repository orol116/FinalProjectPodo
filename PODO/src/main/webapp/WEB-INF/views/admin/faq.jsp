<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="FAQList" value="${map.FAQList}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/admin/faq.css">
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>
<body>
    <main>  
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <section class="content">

            <section class="main">
                <div id="FAQ-container">

                    <div id="FAQ-main">
                        <div id="select-area">
                            <button class="selectBtn" onclick="location.href='/SemiProjectAchieve/FAQ/firstFAQ'">운영정책</button>
                            <button class="selectBtn" onclick="location.href='/SemiProjectAchieve/FAQ/secondFAQ'">계정/인증</button>
                            <button class="selectBtn" onclick="location.href='/SemiProjectAchieve/FAQ/thirdFAQ'">구매/판매</button>
                            <button class="selectBtn" onclick="location.href='/SemiProjectAchieve/FAQ/thirdFAQ'">본인인증</button>
                        </div>

                        <%-- <c:forEach var="faq" items="${FAQList}"> --%>

                            <ul class="FAQ">

                                <li>
                                    <input type="checkbox" id="FAQ-1" value="${faq.boardNo}">
                                    <label for="FAQ-1">로그인 관련 </label>
                                    <div>
                                        <p>아이디는 조회가 가능합니다!</p>
                                        <p>비밀번호는 가입했던 메일을 통해 재설정 해주세요!</p>
                                    </div>
                                </li>

                                <li>
                                    <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                    <label for="FAQ-2">회원가입을 하고 싶어요.</label>
                                    <div>
                                        <p>메인 페이지에서 회원 가입 버튼을 클릭해주세요!</p>
                                        <p>간단한 정보 입력으로 가입이 가능합니다!</p>
                                    </div>
                                </li>

                            </ul>
            
                        <%-- </c:forEach>       --%>

                </div>

            </section>
        </section>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>