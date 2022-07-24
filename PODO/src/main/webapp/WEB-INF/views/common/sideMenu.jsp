<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <section class="left-side">

        <ul class="list-group">
    
            <h3>마이페이지</h3>
            
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/profileUpdate">
                    <img class="profile" src="${contextPath}/resources/images/side-image/profile.png">프로필 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/changePw">
                    <img class="password" src="${contextPath}/resources/images/side-image/password.png">비밀번호 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myFavorites">
                    <img class="favorites" src="${contextPath}/resources/images/side-image/favorites.png">찜 상품 조회
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myLocation">
                    <img class="address" src="${contextPath}/resources/images/side-image/address.png">주소 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/secession">
                    <img class="secession" src="${contextPath}/resources/images/side-image/secession.png">회원 탈퇴
                </a>
            </li>


            <%-- 영문 --%>
            <%-- <li class="myPage-title">MyPage</li>
            
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/profileUpdate">
                    <img class="profile" src="${contextPath}/resources/images/side-image/profile.png">Profile
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/changePw">
                    <img class="password" src="${contextPath}/resources/images/side-image/password.png">Password
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myFavorites">
                    <img class="favorites" src="${contextPath}/resources/images/side-image/favorites.png">Favorites
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/secession">
                    <img class="secession" src="${contextPath}/resources/images/side-image/secession.png">Secession
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myLocation">
                    <img class="address" src="${contextPath}/resources/images/side-image/address.png">Address
                </a>
            </li> --%>
            

            <%-- 초본 --%>
            <%-- <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/profileUpdate">프로필 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/changePw">비밀번호 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/myFavorites">찜 상품 조회</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/secession">회원 탈퇴</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/myLocation">주소 변경</a></li> --%>

        </ul>
    </section>
