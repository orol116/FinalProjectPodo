<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="LCategory" value="${LCategoryList}" />
<c:set var="MCategory" value="${MCategoryList}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PODO 상품등록</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/header-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/member/itemUpload.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

    <main>

        <div class="top-menu">
            <nav id="mainMenu">
                <a href="${contextPath}/member/itemUpload">상품등록</a>
                <a href="${contextPath}/shop/main">상품관리</a>
                <a href="#">구매/판매 내역</a>
            </nav>
        </div>

    
        <div class="basic1">
            <section class="basic">
                <h2>기본정보</h2>
                <span>*필수항목</span>
            </section>
        </div>   

    <form action="${contextPath}/board/itemUpload" enctype="multipart/form-data" method="POST" class="itemUpload" onsubmit="return writeValidate()">
   
        <ul class="basic2">
            <li class="frist">
                <div class="title">
                    상품이미지
                    <span>*</span>
                    
                </div>
                <ul class="second">
                    <div class="img-box">
                        <div class="boardImg">
                            <label for="img1">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" class="inputImage" id="img1" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        <div class="boardImg">
                            <label for="img2">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" class="inputImage" id="img2" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
        
                        <div class="boardImg">
                            <label for="img3">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" class="inputImage" id="img3" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        
                        <div class="boardImg">
                            <label for="img4">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" class="inputImage" id="img4" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                        <div class="boardImg">
                            <label for="img5">
                                <img class="preview" src="#">
                            </label>
                            <input type="file" class="inputImage" id="img5" name="images" accept="image/*">
                            <span class="delete-image">&times;</span>
                        </div>
                   
                    </div>


                <div id="ex">
                    <br>* 상품이미지는 600x600에 최적화 되어있습니다.
                    <br>- 이미지는 상품 등록 시 정사각형으로 잘려서 등록됩니다. 
                    <br>- 이미지를 클릭할 경우 원본이미지를 확인 할 수 있습니다.
                    <br>- 최대 지원사이즈인 640x640으로 준수해주세요.
                    <br>- 큰 이미지일 경우 이미지가 깨지는 경우가 발생할 수 있습니다.
                </div>
                </ul>
            </li>
        </ul>
        
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        제목
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">



                    <li>
                        <section class="search1">                        
                        <input id="search2" type="text" placeholder="상품명 입력" name="boardTitle">  
                    </li> 
                    </section>
                </ul>
            </li>
        </ul>
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        카테고리
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">
                    <li style="display: flex;">
                        <div id="category">
                            <div id="category1">
                                <ul class="category1-1">

                                    <c:forEach var="LCate" items="${LCategory}">
                                        <li> <button type="button" class="select" name="LCate" id="${LCate.LCategoryNo}">${LCate.LCategoryName}</button></li>
                                    </c:forEach>
                                    <%-- <li> <button type="button" class="select" >여성의류</button></li>
                                    <li> <button type="button" class="select" value="남성의류">남성의류</button></li>
                                    <li><button type="button" class="select">신발</button></li>
                                    <li><button type="button" class="select">가방</button></li>
                                    <li><button type="button" class="select">시계/쥬얼리</button></li>
                                    <li><button type="button" class="select">패션 액세사리</button></li>
                                    <li><button type="button" class="select">디지털/가전</button> </li>
                                    <li><button type="button" class="select">스포츠/레저</button></li> --%>
                                </ul>
                            </div>
                        </div>
                        <div id="category">
                             <div id="category2">
                                <ul class="category1-1" name="category2">
                                    <li> <button type="button" class="select"></button></li>
                                    <%-- <li> <button type="button" class="select">남성의류</button></li>
                                    <li><button type="button" class="select">신발</button></li>
                                    <li><button type="button" class="select">가방</button></li>
                                    <li><button type="button" class="select">시계/쥬얼리</button></li>
                                    <li><button type="button" class="select">패션 액세사리</button></li>
                                    <li><button type="button" class="select">디지털/가전</button> </li>
                                    <li><button type="button" class="select">스포츠/레저</button></li> --%>
                                </ul>
                             </div>
                        </div>
                    </li>
                    <div id="category3"> 선택한 카테고리 : 
                        <div id="category4"></div> 
                        <div id="category5"></div> 
                    </div>
                </ul>
            </li>
        </ul>
        <!-- 거래지역 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        거래지역
                        <span>*</span>
                    </div>
                </li>
                <ul class="second">
                    <li>
                        <section class="place">
                            <button>내 위치</button>
                            <button>최근지역</button>
                            <button>주소검색</button>
                            <button>지역설정안함</button>
                        </section>
                        <section class="place2">
                            <input placeholder="선호 거래 지역을 검색해주세요." class="placeResult" value="" readonly>
                        </section>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- 상태 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        상태
                        <span>*</span>
                    </div>
                </li>
            </li>
            <ul class="second">
                <li>
                    <section class="states">
                        
                        <input type="radio" id="secondHand1" name="itemCondition" >
                        <label for="secondHand1">중고상품</label>
                    
                        <input type="radio" id="secondHand2" name="itemCondition">
                        <label for="secondHand2">새상품</label>

                    </section>
                </li>
            </ul>
        </ul>   
        
          
        <!-- 배송 유형 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        배송 유형
                        <span>*</span>
                    </div>
                </li>
            </li>
            <ul class="second">
                <li>
                    <section class="states">
                        <input type="radio" name="delivery" id="delivery1">
                        <label for="delivery1">직거래</label>

                        <input type="radio" name="delivery" id="delivery2">
                        <label for="delivery2">무료배송</label>

                        <input type="radio" name="delivery" id="delivery3">
                        <label for="delivery3">배송비 본인부담</label>
                    </section>
                </li>
            </ul>          
        </ul>

        <!-- 가격 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        가격
                        <span>*</span>
                    </div>
                </li>
            </li>

            <ul class="second">
                <li>
                    <section class="price">
                        <input id="search2" type="number" placeholder="숫자만 입력해주세요."  minlength="2" name="price" >원&nbsp;
                    </section>
                </li>
            </ul> 
        </ul>

        <!-- 설명 -->
        <ul class="basic2">
            <li>
                <li class="frist">
                    <div class="title">
                        설명
                        <span>*</span>
                    </div>
                </li>
            </li>

            <ul class="second">
                <li>
                    <div class="info">
                        <textarea id="info2"  placeholder="여려장의 상품사진과 구입연도, 브랜드, 사용감, 하자 유무등 구매자에게 필요한 정보를 꼭 포함해 주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10자 이상)" name="boardContent"></textarea>
                        <div id="inform">
                        <small>0/1000</small>
                        </div>
                    </div>
                </li>
            </ul> 
        </ul>

        <div class="submit">
            <button class="submit2" type="submit">등록하기</button>
        </div>


       <!-- 수정0> 상세조회 -> 목록으로 or 삭제 -->
            
            <!-- 존재하던 이미지가 제거되었음을 기록하여 전달하는 input -->
            <!-- value에 제거된 이미지의 레벨을 기록 (X버튼 클릭 시)-->
            <!-- DELETE FROM BOARD_IMG 
                 WHERE BOARD_NO = 1000 
                 AND IMG_LEVEL IN (0,3,1,2) -->

        <input type="hidden" name="deleteList" id="deleteList" value="">

        <input type="hidden" name="LCateValue" value="">
        <input type="hidden" name="MCateValue" value="">

      </form>
    </main>
    
         <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/js/itemUpload.js"></script>
    
</body>
</html>