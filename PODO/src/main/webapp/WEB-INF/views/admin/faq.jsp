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
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/1'">운영정책</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/2'">계정/인증</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/3'">구매/판매</button>
                            <button class="selectBtn" onclick="location.href='${contextPath}/admin/faq/4'">본인인증</button>
                        </div>

                        <%-- <c:forEach var="faq" items="${FAQList}"> --%>

                        <ul class="FAQ">

                            <c:forEach var="faq" items="${faqList}">

                                <li>
                                    <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                    <label for="FAQ-2">${faq.boardTitle}</label>
                                    <div>
                                        <p>${faq.boardContent}</p>
                                    </div>
                                </li>

                            </c:forEach>
                            <%-- <li>
                                <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                <label for="FAQ-2">회원가입을 하고 싶어요.</label>
                                <div>
                                    <p>메인 페이지에서 회원 가입 버튼을 클릭해주세요!</p>
                                    <p>간단한 정보 입력으로 가입이 가능합니다!</p>
                                </div>
                            </li>

                            <li>
                                <input type="checkbox" id="FAQ-1" value="${faq.boardNo}">
                                <label for="FAQ-1">회원정보 변경은 어디에서 하나요?</label>
                                <div>
                                    <p>로그인-> 마이페이지 -> 왼쪽 메뉴를 통해 변경할 수 있습니다.</p>
                                    <p>회원정보 변경은 마이페이지에서 직접 처리가 가능합니다.</p><br>
                                    <p>※ 변경가능한 정보 : 프로필, 닉네임, 비밀번호, 주소 등</p>
                                </div>
                            </li> --%>
                            <%-- <li>
                                <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                <label for="FAQ-2">상점정보 변경은 어디에서 하나요?</label>
                                <div>
                                    <p>로그인> 내 상점 > [소개 수정] 선택 후 변경가능</p><br>
                                    <p>상점정보 변경은 내 상점 에서 직접 처리가 가능하며 상점소개 등 수정이 가능합니다.</p>
                                </div>
                            </li>
                                <li>
                                <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                <label for="FAQ-2">본인인증을 받는데 인증번호가 오지 않아요.</label>
                                <div>
                                    <p>스팸번호 등록 여부 확인 필요</p><br>
                                    <p>본인인증 시 인증번호를 지속적으로 받지 못하시는 경우, 단말기 내 스팸문자함을 확인해 주세요.</p>
                                    <p>스팸문자함에서도 확인되지 않는다면 고객센터로 문의를 부탁드립니다.</p>
                                </div>
                            </li>
                            
                                <li>
                                <input type="checkbox" id="FAQ-2" value="${faq.boardNo}">
                                <label for="FAQ-2">회원탈퇴를 하고 싶어요.</label>
                                <div>
                                    <p>로그인-> 마이페이지 -> 왼쪽 메뉴에서 직접 탈퇴 가능</p>
                                    <p>회원탈퇴는 '마이페이지 > 왼쪽 메뉴 > 회원탈퇴' 버튼을 통해 가능하며 탈퇴 전, 아래의 유의사항을 확인 부탁드립니다.</p>
                                    <p> - 탈퇴 시, 계정의 모든 정보는 삭제되며 재가입 시에도 복구되지 않습니다.</p>
                                    <p> - 법령에서 일정기간 정보 보관을 규정하거나 서비스 운영상 반드시 필요한 경우,<br> 
                                    개인정보처리방침에 공개한 내용과 같이 일정한 기간동안 개인정보를 보관 후 파기합니다.</p>
                                    <p>※ 직접 탈퇴가 어려우신 경우, 1:1 문의 접수를 부탁드립니다.<br><br>
                                    - 문의 접수 경로 : 홈페이지하단 > 고객센터 > 1:1 문의<p>
                                </div>
                            </li> --%>
                        </ul>
                </div>

            </section>
        </section>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>