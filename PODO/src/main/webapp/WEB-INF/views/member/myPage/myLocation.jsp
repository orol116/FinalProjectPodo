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
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <title>myLocation</title>
</head>
<body>
    <main>
        <jsp:include page="/WEB-INF/views/common/header.jsp" />


        <div id="container">

            <!-- 사이드 메뉴 -->
            <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />

            <div id="right-area">
                <section id="map-area">
                    <div id="map" style="width:500px;height:400px;margin-top:10px;"></div>
                </section>

                <section id="addr-area">
                    
                    <section>
                        <h3>현재위치</h3>
                        <div id="currentAddr">${memLocal[0].memberAddress}</div>
                    </section>
            
                    <section>
                        <div id="closeTown">설정을 변경하면 추천되는 상품이 변경됩니다.</div>
                    </section>
            
                    <section>
                        <div id="currentSetting">거래하고 싶은 지역은 ${memLocal[0].distance}km이내 입니다.</div>
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
                        <button id="reset-address" type="button">위치 재설정</button>
                        <button id="choose-address" type="button">거래 지역 설정</button>
                    </div>


                    <!-- <%-- 모달창 --%> -->
                    <div class="background">
                        <div class="window">
                            <div class="popup">
                            <button id="close" type="button">팝업닫기</button>
                            <div id="modal-text">거래 지역 설정</div>
                            <div id="modal-area">
                                <select id="distance" name="distance" onchange="showValue(this)">
                                    <option value="0">거리 설정</option>
                                    <option value="2">2km</option>
                                    <option value="4">4km</option>
                                    <option value="6">6km</option>
                                    <option value="8">8km</option>
                                    <option value="10">10km</option>
                                </select>
                            </div>
                                <div id="Btn-area">
                                    <button id="selectBtn">제출</button>
                                </div>
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>

                </section>
                
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </main>


<script>
    var x = "${memLocal[0].DLon}"
    var y = "${memLocal[0].DLat}"
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06bb10cd60ad6e59265c29b83ff6ec2d&libraries=services"></script>
<script src="${contextPath}/resources/js/admin/myLocation.js"></script>

<%-- 카테고리 js --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/js/member/headCategory.js"></script>
<script src="${contextPath}/resources/js/admin/myLocation.js"></script>

</body>
</html>