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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>
        
        <!--  jsp:include 태그
            다른 jsp파일의 내용을 해당 위치에 포함시킴 
            * 경로 작성 시 
                외부 요청 주소 X(인터넷 주소, 최상위 : /community ),  
                내부 접근 경로 O (파일 경로, 최상위 : /webapp )
        -->

        <!-- 내부 접근 절대 경로 -->

	<div class="slide-list">
        <div class="slide1"><img src="resources/images/banner1.png"></div>
        <div class="slide2"></div>
        <div class="slide3"></div>
        
        <!-- <div id="angel">
           <a> <i class="fa-solid fa-angle-left"></i></a>
           <a> <i class="fa-solid fa-angle-right"></i></a>
        </div> -->
    </div>

    <section>
        <div id="itmes"><h2 style="margin:0;">이번주 상품 추천</h2></div>

        ${loginMember}
        <div>
            <div>
                <div class="frame">
                    <div class="box">
                        <a href="${contextPath}/item/detail" class="title">
                            <div class="image">
                                <img src="resources/images/items/image1.jpg"  alt="상품 이미지1">
                            </div>   
                            <div class="title1">
                                <div class="title2">선크림</div>
                                <div class="name2">
                                    <div class="price">5,000원</div>
                                    <div class="time">2일 전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="resources/images/items/image2.jpg"  alt="상품 이미지2">
                            </div>   
                            <div class="title1">
                                <div class="title2">OLIVIA-BURTON 손목 시계</div>
                                <div class="name2">
                                    <div class="price">10,000원</div>
                                    <div class="time">30분 전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="resources/images/items/image3.jpg"  alt="상품 이미지3">
                            </div>   
                            <div class="title1">
                                <div class="title2">갤럭시21 폰케이스</div>
                                <div class="name2">
                                    <div class="price">3,000원</div>
                                    <div class="time">1시간 전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="resources/images/items/image4.jpg"  alt="상품 이미지4">
                            </div>   
                            <div class="title1">
                                <div class="title2">삼성 버즈 케이스</div>
                                <div class="name2">
                                    <div class="price">8,000원</div>
                                    <div class="time">3시간 전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="resources/images/items/image5.jpg" alt="상품 이미지5">
                            </div>   
                            <div class="title1">
                                <div class="title2">CARMEX 립밤</div>
                                <div class="name2">
                                    <div class="price">500원</div>
                                    <div class="time">30일 전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="frame">
                <div class="box">
                    <a href="#" class="title">
                        <div class="image">
                            <img src="#"  alt="상품 이미지6">
                        </div>   
                        <div class="title1">
                            <div class="title2">상품</div>
                            <div class="name2">
                                <div class="price">5000원</div>
                                <div class="time">1분전</div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="box">
                    <a href="#" class="title">
                        <div class="image">
                            <img src="#"  alt="상품 이미지7">
                        </div>   
                        <div class="title1">
                            <div class="title2">상품</div>
                            <div class="name2">
                                <div class="price">5000원</div>
                                <div class="time">1분전</div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="box">
                    <a href="#" class="title">
                        <div class="image">
                            <img src="#" alt="상품 이미지8">
                        </div>   
                        <div class="title1">
                            <div class="title2">상품</div>
                            <div class="name2">
                                <div class="price">5000원</div>
                                <div class="time">1분전</div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="box">
                    <a href="#" class="title">
                        <div class="image">
                            <img src="#"  alt="상품 이미지9">
                        </div>   
                        <div class="title1">
                            <div class="title2">상품</div>
                            <div class="name2">
                                <div class="price">5000원</div>
                                <div class="time">1분전</div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="box">
                    <a href="#" class="title">
                        <div class="image">
                            <img src="#" alt="상품 이미지10">
                        </div>   
                        <div class="title1">
                            <div class="title2">상품</div>
                            <div class="name2">
                                <div class="price">5000원</div>
                                <div class="time">1분전</div>
                            </div>
                        </div>
                    </a>
                </div>
                </div>
                <div class="frame">
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="#" alt="상품 이미지11">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="#"  alt="상품 이미지12">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="#" alt="상품 이미지13">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="#" width="194" height="194" alt="상품 이미지2">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="box">
                        <a href="#" class="title">
                            <div class="image">
                                <img src="#" width="194" height="194" alt="상품 이미지2">
                            </div>   
                            <div class="title1">
                                <div class="title2">상품</div>
                                <div class="name2">
                                    <div class="price">5000원</div>
                                    <div class="time">1분전</div>
                                </div>
                            </div>
                        </a>
                    </div>
                    </div>
                    <div class="frame">
                        <div class="box">
                            <a href="#" class="title">
                                <div class="image">
                                    <img src="#" width="194" height="194" alt="상품 이미지2">
                                </div>   
                                <div class="title1">
                                    <div class="title2">상품</div>
                                    <div class="name2">
                                        <div class="price">5000원</div>
                                        <div class="time">1분전</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="box">
                            <a href="#" class="title">
                                <div class="image">
                                    <img src="#" width="194" height="194" alt="상품 이미지2">
                                </div>   
                                <div class="title1">
                                    <div class="title2">상품</div>
                                    <div class="name2">
                                        <div class="price">5000원</div>
                                        <div class="time">1분전</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="box">
                            <a href="#" class="title">
                                <div class="image">
                                    <img src="#" width="194" height="194" alt="상품 이미지2">
                                </div>   
                                <div class="title1">
                                    <div class="title2">상품</div>
                                    <div class="name2">
                                        <div class="price">5000원</div>
                                        <div class="time">1분전</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="box">
                            <a href="#" class="title">
                                <div class="image">
                                    <img src="#" width="194" height="194" alt="상품 이미지2">
                                </div>   
                                <div class="title1">
                                    <div class="title2">상품</div>
                                    <div class="name2">
                                        <div class="price">5000원</div>
                                        <div class="time">1분전</div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="box">
                            <a href="#" class="title">
                                <div class="image">
                                    <img src="#" width="194" height="194" alt="상품 이미지2">
                                </div>   
                                <div class="title1">
                                    <div class="title2">상품</div>
                                    <div class="name2">
                                        <div class="price">5000원</div>
                                        <div class="time">1분전</div>
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
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
   
    <!-- main.js 연결 -->
    <%-- <script src="${contextPath}/resources/js/main.js"></script> --%>

</body>
</html>