<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>podo</title>
    
    <link rel="stylesheet" href="resources/css/main-style.css">
    
    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
</head>

<body>
    <main>
	<jsp:include page="/WEB-INF/views/podo/header.jsp" />
        
        <!--  jsp:include 태그
            다른 jsp파일의 내용을 해당 위치에 포함시킴 
            * 경로 작성 시 
                외부 요청 주소 X(인터넷 주소, 최상위 : /community ),  
                내부 접근 경로 O (파일 경로, 최상위 : /webapp )
        -->

        <!-- 내부 접근 절대 경로 -->

	<div class="slide-list">
        <div class="slide1"></div>
        <div class="slide2"></div>
        <div class="slide3"></div>
        <div class="slide4"></div>
        <div id="angel">
            <i class="fa-solid fa-angle-left"></i>
            <i class="fa-solid fa-angle-right"></i>
        </div>
    </div>

    <section class="items">
        <h2>오늘의 상품 추천</h2>
        <div>
            <div>
                <div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="#" width="194" height="194" alt="상품 이미지1">
                                <div class="title1">
                                    <div class="title2"></div>
                                    <div class="name2">
                                        <div class="price"></div>
                                        <div class="time"></div>
                                    </div>
                                </div>
                        
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="#" width="194" height="194" alt="상품 이미지2">
                                <div class="title1">
                                    <div class="title2"></div>
                                    <div class="name2">
                                        <div class="price"></div>
                                        <div class="time"></div>
                                    </div>
                                </div>
                        
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="#" width="194" height="194" alt="상품 이미지3">
                                <div class="title1">
                                    <div class="title2"></div>
                                    <div class="name2">
                                        <div class="price"></div>
                                        <div class="time"></div>
                                    </div>
                                </div>
                        
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="#" width="194" height="194" alt="상품 이미지4">
                                <div class="title1">
                                    <div class="title2"></div>
                                    <div class="name2">
                                        <div class="price"></div>
                                        <div class="time"></div>
                                    </div>
                                </div>
                        
                            </div>
                        </a>
                    </div>
                    <div>
                        <a href="#">
                            <div>
                                <img src="#" width="194" height="194" alt="상품 이미지4">
                                <div class="title1">
                                    <div class="title2"></div>
                                    <div class="name2">
                                        <div class="price"></div>
                                        <div class="time"></div>
                                    </div>
                                </div>
                        
                            </div>
                        </a>
                    </div>
                    
                </div>
            </div>
                
        </div>

    </section>
    </main>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/podo/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
   
    <!-- main.js 연결 -->
    <%-- <script src="${contextPath}/resources/js/main.js"></script> --%>

</body>
</html>