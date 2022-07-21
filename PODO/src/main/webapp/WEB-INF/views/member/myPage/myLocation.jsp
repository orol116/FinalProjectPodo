<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/admin/myLocation.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <title>myLocation</title>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div id="container">

            <div id="right-area">
                <section id="map-area">
                    <div id="map" style="width:500px;height:400px;margin-top:10px;"></div>
                </section>

                <section id="addr-area">
                    
                    <section>
                        <h3>현재위치</h3>
                        <div id="currentAddr">서울시 강서구 화곡동</div>
                    </section>
            
                    <section>
                        <div id="closeTown">양천구, 마포구의 게시물이 추천됩니다.</div>
                    </section>
            
                    <section>
                        <div id="currentSetting">거래하고 싶은 지역은 XXkm까지로 제한됩니다.</div>
                    </section>

                    <div id="addr-input">
                        <input type="text" id="sample5_address" name="sample5_address" placeholder="주소">
                        <div id="addrBtn-area">
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" id="searchBtn"><br>
                        </div>
                        <input type="hidden" name="dLon" id="dLon" value="">
                        <input type="hidden" name="dLat" id="dLat" value=""> 
                    </div>

                    <div id="AddressBtn-area">
                        <button id="reset-address">위치 재설정</button>
                        <button id="choose-address">거래 지역 설정</button>
                    </div>
                </section>
                
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bb10cd60ad6e59265c29b83ff6ec2d&libraries=services"></script>
<script src="${contextPath}/resources/js/admin/myLocation.js"></script>

<%-- 카테고리 js --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/member/headCategory.js"></script>
<script src="${contextPath}/resources/js/admin/myLocation.js"></script>

</body>
</html>