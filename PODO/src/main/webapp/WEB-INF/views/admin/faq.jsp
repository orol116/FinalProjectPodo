<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%-- <c:set var="FAQList" value="${map.FAQList}"/> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/faq.css">
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
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/1'">운영정책</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/2'">회원/계정</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/3'">구매/판매</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/4'">이용방법</button>
                        </div>


                        <ul class="FAQ">

                            <c:forEach var="faq" items="${faqList}">
                                <li>
                                    <input type="checkbox" id="FAQ-${faq.boardNo}" value="${faq.boardNo}">
                                    <label for="FAQ-${faq.boardNo}">${faq.boardTitle}</label>
                                     <div>
                                        <p>${faq.boardContent}</p>
                                    </div>
                               </li>
                            </c:forEach>
                          
                        </ul>
                </div>

            </section>
        </section>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="${contextPath}/resources/js/member/headCategory.js"></script>

</body>
</html>