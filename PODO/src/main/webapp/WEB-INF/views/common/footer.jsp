<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <link rel="stylesheet" href="${contextPath}/resources/css/footer-style.css">
<footer>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
	
    <div id="footer">
        <div id="footer1">
            <div class="frist">PODO(주) 사업자정보</div>
            <div>
                호스팅서비스 제공자 : 최강1팀
                <br>
                Email : help@podo.co.kr
                <br>
                주소 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
                <br>
                (남대문로 1가 대일빌딩)
            </div>
            <div class="fifth">
                <a href="#">회사소개&nbsp|</a>
                <a href="#">이용약관&nbsp|</a>
                <a href="#">운영정책</a>
            </div>
        </div>

        <div id="footer2" >
            <div class="second">고객센터</div>
            <div class="third">02)9874-6541</div>
            <div>
            운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 13시 - 14시)
            </div>
            
                <div class="fourth">
                    <a href="#">공지사항&nbsp|</a>
                    <a href="#">1:1 문의사항&nbsp|</a>
                    <a href="#">자주 묻는 질문</a>
                </div>
        </div>
    </div>
</footer>

<c:if test="${ !empty message }">
    <script>
        alert("${message}");
    </script>
</c:if> 
