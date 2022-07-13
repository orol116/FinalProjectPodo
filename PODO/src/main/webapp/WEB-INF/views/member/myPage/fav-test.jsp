<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜 상품 조회</title>

    <link rel="stylesheet" href="../../css/main-style.css">
    <link rel="stylesheet" href="../../css/mypage/sideMenu.css">
    <link rel="stylesheet" href="../../css/mypage/myPage-favorites-style.css">
    
</head>
<body>

    <!-- header -->
    <script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
    <header>
        <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
        
        <div id="top">
            <a href="#">로그인  
            <a href="#">회원가입
            <a href="#">고객센터
        </div>

        <div id="header">
            <section id="menu"> 
                <i class="fa-solid fa-bars"></i>
                <a href="${contextPath}" >
                    <img src="../images/logo.png" id="home-logo">
                </a>
            </section>
            
            <section class="mid-header">
                <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
                <a id="button"><i class="fa-solid fa-magnifying-glass"></i></a>
            </section>
            <section class="right-header">
                <i class="fa-regular fa-bell" href="#"></i>
                <i class="fa-regular fa-basket-shopping" href="#"></i>      
                <i class="fa-regular fa-message" href="#"></i>
            </section>
        </div>
    </header>

    <!-- 사이드 메뉴 -->
    <section class="left-side">
    
        <ul class="list-group">
    
            <li class="myPage-title">마이페이지</li>
                
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/profileUpdate">프로필 수정</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/changePw">비밀번호 변경</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/myFavorites">찜 상품 조회</a></li>
            <li class="myPage-subTitle"><a href="${contextPath}/member/myPage/secession">회원 탈퇴</a></li>

        </ul>
    </section>
    
    <!-- 본문 영역 -->
    <section class="myPage-inner">
            
        <section class="myPage-main">
            
            <h1 class="myPage-title">찜 상품 조회</h1>

            <!-- 찜 상품 카운트 -->
            <div class="fav-count"> <!-- 찜 카운트 영역 -->
                <div>"찜"
                    <span class="count">1</span>
                </div>
            </div>

            <!-- 찜 목록 본문 -->
            <div class="fav-contents">

                <!-- 찜 상단 체크 박스 / 선택 삭제 -->
                <div class="fav-header">
                    <div class="fav-header-left">

                        <!-- 상단 체크박스 -->
                        <div class="check-area">
                            <button type="button" class="fav-check-btn"></button>
                        </div>

                        <!-- 선택삭제 -->
                        <button class="fav-delete">선택삭제</button>

                    </div>

                    <!-- 찜 정렬 메뉴 -->
                    <select>
                        <option value="new-wish">최신순</option>
                        <option value="high-wish">찜 많은 상품순</option>
                        <option value="lowprice">저가순</option>
                        <option value="highprice">고가순</option>
                    </select>
                </div>

                <%-- --------------------------------------------------------------------- --%>

                <%-- 찜 버튼 임시, 다른곳에서 사용 --%>
                <button class="btn btn-default btn-wishlist">찜 목록에 추가</button>



                <%-- --------------------------------------------------------------------- --%>

                <!-- 출력부 -->
                <div class="">
                    <!-- 개별 상품 -->
                    <div class="">

                        <!-- 상품 세부 -->
                        <div class="product-detail" href="/products/?ref=?">

                            <!-- 상품 체크박스 -->
                            <div class="check-area">
                                <button type="button" class="fav-check-btn"></button>
                            </div>
                            
                            <!-- 조회된 찜 상품 좌측 이미지 영역 -->
                            <div class="product-img">
                                <img src="" alt="상품 이미지">
                                <div></div>
                            </div>
                                
                            <!-- 조회된 찜 상품 우측 상세 내용 영역 -->
                            <div class="product-wholeContent">
                                <div class="product-info">
                                    
                                    <!-- 판매 상품 제목 -->
                                    <div class="product-title">${board.boardTitle}</div>

                                    <!-- 판매 상품 가격 -->
                                    <div class="product-price">
                                        <div>
                                            ${board.price}
                                        </div>
                                    </div>

                                    <!-- 판매 상품 등록일 -->
                                    <div class="upload-date">${board.createDate}</div>
                                </div>
                                
                                <!-- 위치 정보 -->
                                <div class="location">
                                    <!-- 위치 로고 이미지 -->
                                    <img src="resources/images/location-logo.png" width="15" height="17" alt="위치 아이콘">
                                    ${board.sellArea}
                                </div>
                            </div>

                            
                        </a>
                    </div>
                </div>
            </div>

        </section>

    </section>


</body>
</html>