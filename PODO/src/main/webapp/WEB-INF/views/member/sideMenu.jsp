<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 사이드 메뉴 -->
    <section class="left-side">

        <ul class="list-group">
    
            <li class="myPage-title">마이페이지</li>
            
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/changeImage">프로필 이미지 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/#">구매/판매 내역</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/#">찜 상품 조회</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/#">회원 정보 수정</a></li>

        </ul>
    </section>