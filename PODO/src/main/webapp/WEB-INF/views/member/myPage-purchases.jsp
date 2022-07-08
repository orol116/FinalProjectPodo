<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>거래내역</title>
</head>
<body>

    <header class="">
        <h1>거래내역</h1>
    </header>

    <main class="">

    </main>
    

    <main class="">
        <nav class="">
            <!-- 구매 내역 메뉴 -->
            <ul class="">

                <li class="selected">
                    <button type="button" data-index="0">구매</button>
                </li>

                <li class="">
                    <button type="button" data-index="1">판매</button>
                </li>

            </ul>

            <div class="">
                <!-- 상태 검색 메뉴 -->
                <nav class="">
                    <div>
                        <button class="">전체 상태</button>
                        <button class="">진행중</button>
                        <button class="">완료</button>
                        <button class="">취소/환불</button>
                    </div>
                </nav>

                <!-- 판매 내역 출력 -->
                <div class="">
                    <div class="">구매/판매 내역이 없습니다.</div>
                </div>
            </div>
        </nav>
    </main>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

</body>
</html>