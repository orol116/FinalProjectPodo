<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜 상품 조회</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-favorites-style.css">
    
</head>
<body>

    
    
    <!-- 상품 찜 기능 -->
    <div class="icon" style="float: left; padding-left: 20px; padding-top: 10px;">
    <!-- 찜하기 했을 경우 해당 정보 가져오기 -->
    <span id="prd_like_num" style="display: none;">${prdLikeVal.prdct_like_number}</span>
    <%-- 찜하기 기능은 고객(MEMBER 권한)만 이용할 수 있게 설정 --%>     
    <sec:authorize access="isAnonymous()">
        <%-- 로그인 상태가 아니므로 자동으로 로그인 comfirm창이 뜨게 설정 --%>
        <i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
    </sec:authorize>

    <sec:authorize access="hasAuthority('ADMIN')">
        <i class="fa fa-heart-o fa-2x">찜불가</i>
    </sec:authorize>

    <sec:authorize access="hasAuthority('SELLER')">
        <i class="fa fa-heart-o fa-2x">찜불가</i>    
    </sec:authorize> 

    <sec:authorize access="hasAuthority('MEMBER')">
        <c:choose>
            <%-- prdct_like 테이블을 가져와 비교후 예전에 찜하기를 했었다면 찜취소로 활성화가 된다 --%>
            <c:when test="${(prdLikeVal.prdct_id eq prdct.prdct_id) and (prdLikeVal.mbr_id eq mbr.mbr_id)}">
                <i id="prdct_like_ena" class="fa fa-heart fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜취소</i>
            </c:when>
            <%-- prdct_like 테이블을 가져와 비교후 예전에 찜하기를 안했다면(혹은 찜취소를 했었다면) 찜하기로 활성화가 된다 --%>
            <c:otherwise>
                <i id="prdct_like_dis" class="fa fa-heart-o fa-2x" onclick="location.href='${pageContext.request.contextPath}/prdct/{prdct_id}'">찜하기</i>
            </c:otherwise>
        </c:choose>
    </sec:authorize>

</div>


</body>
</html>