<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>1:1문의</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/member/inquireList.css">
    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="body">
    <div class="top-menu">
        <nav id="mainMenu">
            <h3>1:1문의</h3>
            <a id="inquire" href="inquire?iq=y">문의하기</a>
        </nav>
    </div>
    <div class="list1">
        <ul> 
            <li id="one">
                <div class="list2">
                    <section class="list3">
                        <section class="list4">
                            <h4>기타</h4>
                            <a href="#">기타서비스</a>
                        </section>
                        <button id="show">문의취소</button>
                    </section>
                    <p>접수완료</p>
                    <div class="background">
                        <div class="window">
                          <div class="popup">
                            <button id="close" type="button">x</button>
                            <div id="report-text">해당문의를 취소하시겠습니까?</div>
                            <div id="report-area">
                                <button id="ok">확인</button>
                                <button id="cancel">취소</button>  
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
              
          <ul> 
            <li id="one">
                <div class="list2">
                    <section class="list3">
                        <section class="list4">
                            <h4>기타</h4>
                            <a href="#">기타서비스</a>
                        </section>
                        <button id="show">문의취소</button>
                    </section>
                    <p>접수완료</p>
                    <div class="background">
                        <div class="window">
                          <div class="popup">
                            <button id="close" type="button">x</button>
                            <div id="report-text">해당문의를 취소하시겠습니까?</div>
                            <div id="report-area">
                                <button id="ok">확인</button>
                                <button id="cancel">취소</button>  
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
         <ul> 
            <li id="one">
                <div class="list2">
                    <section class="list3">
                        <section class="list4">
                            <h4>기타</h4>
                            <a href="#">기타서비스</a>
                        </section>
                        <button id="show">문의취소</button>
                    </section>
                    <p>접수완료</p>
                    <div class="background">
                        <div class="window">
                          <div class="popup">
                            <button id="close" type="button">x</button>
                            <div id="report-text">해당문의를 취소하시겠습니까?</div>
                            <div id="report-area">
                                <button id="ok">확인</button>
                                <button id="cancel">취소</button>  
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        
    </div>

    <div class="inform">
        <h4>유의사항</h4>
        <ul>
            <li>자주묻는 질문을 확인하면 답변을 빨리 받을 수 있어요.</li>
            <li>접수는 24시간 가능하지만, 답변은 9시~18시 사이에 순차적으로 받을 수 있어요.</li>
            <li>문의 취소는 접수상태에서만 가능해요.</li>
        </ul>
    </div>

  
      
</div>
    <script src="${contextPath}/resources/js/member/inquireList.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>


</html>