<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/inquire.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="body">
    <div class="top-menu">
        <nav id="mainMenu">
            <h3 >1:1문의</h3>
        </nav>
    </div>

    <form id="inquire" action="${contextPath}/member/inquire" method="POST" enctype="multipart/form-data" onsubmit="return writeValidate() ">

        <div class="option">
            <div class="select">
                <h4>유형 선택</h4>
                <select name="select" form="inquire">
                    <optgroup label="유형">
                    <option value="운영정책">운영정책</option>
                    <option value="계정/인증">계정/인증</option>
                    <option value="구매/판매">구매/판매</option>
                    <option value="본인인증">본인인증</option>
                    <option value="기타" selected>기타</option>
                    </optgroup>
                </select>
            </div>
            <div class="title">
                
            </div>
        </div>

        <div>
            <div  class="box" >
                <textarea id="textarea" type="text" name = "boardContent" placeholder="문의내역을 입력해주세요."></textarea>    
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
                    <button type="submit" id="submit">등록</button>
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