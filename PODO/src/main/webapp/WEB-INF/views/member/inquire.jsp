<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의하기</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/inquire.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="body">
    <div class="top-menu">
        <nav id="mainMenu">
            <h3 >1:1문의하기</h3>
        </nav>
    </div>

    <form action="inquire" method="post" id="inquire" class="inquire">

    <div class="option">
        <div class="select">
            <h4>분류</h4>
            <select>
                <option disabled>유형을 선택해주세요.</option>
                <option>거래신고</option>
                <option>회원/계정</option>
                <option>기타서비스</option>
                <option>판매광고</option>
                <option>오류/신고/제안</option>
            </select>
        </div>
        <div class="title">
            
        </div>
    </div>

    <div>
        <div  class="box" >
        <textarea id="textarea" type="text" placeholder="문의내역을 입력해주세요."></textarea>    
        </div>
        <section class="place">
            <h4>사진첨부</h4>
            <p>사진을 첨부하면 정확한 답변을 받을 수 있어요.</p>
        </section>
            <div class="img-box">
                <div class="boardImg">
                    <label for="img0">
                        <img class="preview" src="${contextPath}/resources/images/image.png">
                    </label>
                    <input type="file" class="inputImage" id="img0" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
                <div class="boardImg">
                    <label for="img1">
                        <img class="preview" src="${contextPath}/resources/images/image.png">
                    </label>
                    <input type="file" class="inputImage" id="img1" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
                <div class="boardImg">
                    <label for="img2">
                        <img class="preview" src="${contextPath}/resources/images/image.png">
                    </label>
                    <input type="file" class="inputImage" id="img2" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
                <div class="boardImg">
                    <label for="img3">
                        <img class="preview" src="${contextPath}/resources/images/image.png">
                    </label>
                    <input type="file" class="inputImage" id="img3" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
                <div class="boardImg">
                    <label for="img4">
                        <img class="preview" src="${contextPath}/resources/images/image.png">
                    </label>
                    <input type="file" class="inputImage" id="img4" name="images" accept="image/*">
                    <span class="delete-image">&times;</span>
                </div>
            </div>
            <div class="div1">
                <button type="submit" form="FAQ" id="submit">등록</button>
            </div>
        </form>
    </div>
    </form>
</div>
    <script src="${contextPath}/resources/js/member/inquire.js"></script>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>