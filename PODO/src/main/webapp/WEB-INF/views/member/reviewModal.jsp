<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 작성용 모달</title>
</head>
<body>
    <div class="review-body">
        <h1 class="myPage-title">후기 남기기</h1>

        <div class="logo-image">
            <img src="${contextPath}/resources/images/logo.png" alt="포도 로고">
        </div>

        <h4 class="myPage-subtitle">거래는 어떠셨어요?</h4>

        <form action="review" method="POST" name="review-write-form" onsubmit="return reviewValidate()">

            <div class="review-table">
                <div class="review-table-title">만족도</div>
                <div class="review-table-thumbs">
                    <%-- <a href="javascript:void(0);" class="icon-thumbs thumbs-down _thumbs-down" data-answer-id="8" data-thumbs-status="DOWN">thumbs down</a>
                    <a href="javascript:void(0);" class="icon-thumbs thumbs-up _thumbs-up" data-answer-id="7" data-thumbs-status="UP">thumbs up</a> --%>
                    
                    <button type="button" class="btn btn-warning " id="like-btn" onclick="updateLike()">
                        <img src="${contextPath}/resources/images/icon-thumb-up.png">
                    </button>
                    <button type="button" class="btn btn-danger" id="dislike-btn" onclick="updateDislike()">
                        <img src="${contextPath}/resources/images/icon-thumb-down.png">
                    </button>
                            

                </div>
            </div>

            <div class="my-review">
                <div class="my-review-title">상세 후기</div>

                <div class="my-review-content">

                    <%-- 후기 내용 --%>
                    <div class="my-review-content-text-wrap">
                        <textarea class="my-review-text-area" name="reviewContent" rows="5" placeholder="고객님의 솔직한 리뷰를 남겨주세요. (상품과 관련있는 후기 내용만 작성해주세요.)">${rewiew.reviewContent}</textarea>
                    </div>

                </div>

                <div class="review-register">
                    <button class="cancel-button" type="button">취소하기</button>
                    <button class="submit-button" type="button" onclick="writeReviewFn()">등록하기</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>