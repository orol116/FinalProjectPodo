<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 사이드 메뉴 -->
    <section class="left-side">

        <ul class="list-group">
    
            <li class="myPage-title">MyPage</li>
            
            <%-- 프로필 변경 --%>
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/profileUpdate">
                    <img class="profile" src="${contextPath}/resources/images/side-image/profile.png">Profile
                </a>
            </li>

            <%-- 비밀번호 변경 --%>
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/changePw">
                    <img class="profile" src="${contextPath}/resources/images/side-image/password.png">Password
                </a>
            </li>

            <%-- 찜 상품 조회 --%>
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myFavorites">
                    <img class="profile" src="${contextPath}/resources/images/side-image/favorites.png">Favorites
                </a>
            </li>

            <%-- 회원 탈퇴 --%>
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/secession">
                    <img class="profile" src="${contextPath}/resources/images/side-image/secession.png">Secession
                </a>
            </li>

            <%-- 주소 변경 --%>
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myLocation">
                    <img class="profile" src="${contextPath}/resources/images/side-image/address.png">Address
                </a>
            </li>


            

            <%-- <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/profileUpdate">프로필 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/changePw">비밀번호 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/myFavorites">찜 상품 조회</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/secession">회원 탈퇴</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/myLocation">주소 변경</a></li> --%>

        </ul>
    </section>