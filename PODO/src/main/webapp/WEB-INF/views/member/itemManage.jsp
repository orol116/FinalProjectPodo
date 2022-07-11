<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PODO 상품관리</title>
    <link rel="stylesheet" href="../../css/header-style.css">
    <link rel="stylesheet" href="../../css/member/itemManage.css">
    <link rel="stylesheet" href="../../css/footer-style.css">
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<header>
    <div id="top">
        <a href="#">로그인
        <a href="#">회원가입
        <a href="#">고객센터
    </div>

    <div id="header">
        <section id="menu"> 
            <i class="fa-solid fa-bars"></i>
            <a href="${contextPath}" >
                <img src="../../images/logo.png" id="home-logo">
            </a>
        </section>
        
        <section class="mid-header">
            <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
        </section>
        <section class="right-header">
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-won-sign" ></i>판매하기</button>
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-house-user"></i>내상점</button>   
            <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-message"></i>포도톡</button>
        </section>
    </div>
</header>
<body>

    <div class="top-menu">
        <nav id="mainMenu">
            <a href="#">상품등록</a>
            <a href="#">상품관리</a>
            <a href="#">구매/판매 내역</a>
        </nav>
    </div>
    <div class="basic1">
        <section class="basic">
            <form class="search1" action="#" method="post" id="search">
                <input id="search2" type="text" placeholder="상품명을 입력해주세요.">
                <button class="button" onclick = "location.href = '#'"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </section>
        <div>
            <div>
                <select>
                    <option>10개씩</option>
                    <option>20개씩</option>
                    <option>30개씩</option>
                    <option>40개씩</option>
                    <option>50개씩</option>
                </select>
            </div>
        </div>
        <div>
            <div>
                <select>
                    <option>전체</option>
                    <option>판매 중</option>
                    <option>예약 중</option>
                    <option>판매완료</option>
                </select>
            </div>
        </div>
    </div>   
    <div>
        <table>
            <thead>
                <tr id="head">
                    <th>사진</th>
                    <th>판매상태</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>찜/댓글</th>
                    <th>최근수정일</th>
                    <th>기능</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a><img src="../../images/items/image1.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>  

                <tr>
                    <td>
                        <a><img src="../../images/items/image2.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="../../images/items/image3.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="../../images/items/image4.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                <tr>
                    <td>
                        <a><img src="../../images/items/image5.jpg"></a>
                    </td>
                    
                    <td>
                        <select>
                            <option>전체</option>
                            <option>판매 중</option>
                            <option>예약 중</option>
                            <option>판매완료</option>
                        </select>
                    </td>
                    <td><a href="#" id="name">썬크림</a></td>
                    <td>5000원</td>
                    <td>0/0</td>
                    <td>2022-06-30 18:07</td>
                    <td class="choice">
                        <button class="choice1">UP</button>
                        <a href="#" class="choice2">수정</a>
                    </td>
                </tr>    
                
                
                
            </tbody>
        </table>
    </div>
 
    <div class="pagination">
        <a href="#">&laquo;</a>
        <a href="#">1</a>
        <a class="active" href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">&raquo;</a>
    </div>




</body>
<footer>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
	
    <div id="footer">
        <div id="footer1">
            <div class="frist">PODO(주) 사업자정보</div>
            <div>
                호스팅서비스 제공자 : 최강1팀
                <br>
                Email : help@podo.co.kr
                <br>
                주소 : 주소 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F
                <br>
                (남대문로 1가 대일빌딩)
            </div>
            <div class="fifth">
                <a href="#">회사소개&nbsp|</a>
                <a href="#">이용약관&nbsp|</a>
                <a href="#">운영정책</a>
            </div>
        </div>

        <div id="footer2" >
            <div class="second">고객센터</div>
            <div class="third">02)9874-6541</div>
            <div>
            운영시간 9시 - 18시 (주말/공휴일 휴무, 점심시간 13시 - 14시)
            </div>
            
                <div class="fourth">
                    <a href="#">공지사항&nbsp|</a>
                    <a href="#">1:1 문의사항&nbsp|</a>
                    <a href="#">자주 묻는 질문</a>
                </div>
        </div>
    </div>
</footer>
</html>
