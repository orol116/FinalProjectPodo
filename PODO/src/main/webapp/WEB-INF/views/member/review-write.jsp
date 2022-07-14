<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰 남기기(후기 작성) 페이지</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/myPage-profileUpdate-style.css">

</head>
<body>
    
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    <h1 class="myPage-title">후기 남기기</h1>

    <div class="image">
        <img src="${contextPath}/resources/images/logo.png" alt="포도 로고">
    </div>

    <h4 class="myPage-subtitle">거래는 어떠셨어요?</h4>

    <form action="review" method="POST" name="review-write-form" onsubmit="return reviewValidate()">

        <div class="review-table">
            <div class="review-table-title">만족도</div>
            <div class="review-table-thumbs">
                <a href="javascript:void(0);" class="icon-thumbs thumbs-down _thumbs-down" data-answer-id="8" data-thumbs-status="DOWN">thumbs down</a>
                <a href="javascript:void(0);" class="icon-thumbs thumbs-up _thumbs-up" data-answer-id="7" data-thumbs-status="UP">thumbs up</a>
            </div>
        </div>

        <div class="my-review">
            <div class="my-review-title">상세 후기</div>

            <div class="my-review-content">

                <%-- 제목 --%>
                <h1 class="review-content-title">
                    <input type="text" name="reviewTitle" placeholder="제목을 입력해주세요." value="${review.reviewTitle}">         
                </h1>

                <%-- 내용 --%>
                <div class="my-review-content-text-wrap">
                    <textarea class="my-review-text-area" name="reviewContent" rows="5" placeholder="고객님의 솔직한 리뷰를 남겨주세요. (상품과 관련있는 후기 내용만 작성해주세요.)">${rewiew.reviewContent}</textarea>
                </div>

            </div>

            <div class="review-register">
                <button class="cancel-button" type="button">취소하기</button>
                <button class="submit-button" type="button">등록하기</button>
            </div>
        </div>
    </form>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
    </script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- js -->
    <script src="${contextPath}/resources/js/reviewWrite.js"></script>
</body>
</html>