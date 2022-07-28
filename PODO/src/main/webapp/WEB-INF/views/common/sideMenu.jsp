<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <section class="left-side">

        <ul class="list-group">
    
            <h3>마이페이지</h3>
            
            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/profileUpdate">프로필 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/changePw">비밀번호 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myFavorites">찜 상품 조회
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/myLocation">주소 변경
                </a>
            </li>

            <li class="myPage-subTitle">
                <a href="${contextPath}/member/myPage/secession">회원 탈퇴
                </a>
            </li>


          
        </ul>
    </section>
