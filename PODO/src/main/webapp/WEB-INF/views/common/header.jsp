<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>   

<c:set var="LCategory" value="${LCategoryList}" />
<c:set var="MCategory" value="${MCategoryList}" />

<script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<script>
    const contextPath = "${contextPath}";
    const mcNo = "${param.mCategoryNo}";
</script>
<link rel="stylesheet" href="${contextPath}/resources/css/header-style.css"> 

<header>

    <script src="https://kit.fontawesome.com/a2e8ca0ae3.js" crossorigin="anonymous"></script>
   
    
    <div id="top">
        <c:choose>
            <c:when test="${empty sessionScope.loginMember}">
                    <a href="${contextPath}/member/login">로그인</a>
                    <a href="${contextPath}/member/signUp">회원가입</a>
            </c:when>
            <c:otherwise>
                <a href="${contextPath}/member/logout">로그아웃</a>

                <%-- <a class=alert1><i class="fa-solid fa-bell">알림</i></a> --%>

                <a href="${contextPath}/member/myPage/changePw">마이페이지</a>

                <div class="alert2" >
                    
                    <%-- <p id="socketAlert">

                    </p> --%>
                    <div id="socketAlert" ></div>
                    <p id="socketAlet2">
                        <i class="fa-solid fa-bell">알림</i><br><br>
                    </p>
                    

                </div> 
                
                    
            </c:otherwise>
        </c:choose>    
       
    </div>

    <div id="header">
        <section id="menu"> 
        
            <a><i class="fa-solid fa-bars" id="fa-bars"></i></a>
            <a href="${contextPath}" >
                <img src="${contextPath}/resources/images/logo.png" id="home-logo">
            </a>
        </section>

        
        
        <form action="main" method="get" id="boardSerch" onclick="return searchValidate()"> 
            <section class="mid-header">

                <input id="search2" type="text" name="query" placeholder="상품명을 입력해주세요.">
                <button class="button" method="submit"><i class="fa-solid fa-magnifying-glass"></i></button>       
            </section>
        </form> 

        <section class="right-header">

            <c:choose>
                <c:when test="${empty loginMember}">
                    <button class="button" onclick="alert('로그인 후 이용해주세요.');return false;"><i class="fa-solid fa-won-sign" ></i>판매하기</button>
                    <button class="button" onclick="alert('로그인 후 이용해주세요.');return false;"><i class="fa-solid fa-house-user"></i>내 상점</button>
                    <button class="button" onclick="alert('로그인 후 이용해주세요.');return false;"><i class="fa-solid fa-message"></i>포도톡</button>
                </c:when>
                <c:otherwise>
                    <button class="button" onclick = "location.href = '${contextPath}/member/itemUpload'"><i class="fa-solid fa-won-sign" ></i>판매하기</button>
                    <button class="button" onclick = "location.href = '${contextPath}/shop/memberShop/${loginMember.memberNo}'"><i class="fa-solid fa-house-user"></i>내 상점</button>
                    <button class="button" onclick = "location.href = '${contextPath}/chat/roomList'"><i class="fa-solid fa-message"></i>포도톡</button>
                </c:otherwise>
            </c:choose> 

        </section>
        <div id="category-area">
        <ul id="item-category">
            <li class="category-name" href="#" id="0">
                전체 카테고리
            </li>

            <c:forEach var="ct" items="${LCategory}">

                <li class="category-name" href="#" id="${ct.LCategoryNo}">
                    ${ct.LCategoryName}
                </li>
            </c:forEach>

           
        </ul>


        <ul id="div-category">
            <c:forEach var="subCt" items="${MCategory}">

                <li class="sub-category-name ${subCt.LCategoryNo}-sub" href="#" 
                id="s-${subCt.MCategoryNo}" name="${subCt.MCategoryName}">
                    ${subCt.MCategoryName}
                    
                </li>
            </c:forEach>
           
        </ul>
    </div>
    

    </div>
</header>
	<script>
       // 검색창 유효성 검사
       function searchValidate(){

            const query = document.getElementById("search2");

            if(query.value.trim().length == 0){ // 미작성
                query.value = ""; // 빈칸
                query.focus();

                return false;
            }
            return true;
       }

        const memberNo = "${loginMember.memberNo}";
        const memberId = "${loginMember.memberId}";
        const memberNickname = "${loginMember.memberNickname}";
        console.log(memberId);

        //소켓
        $(document).ready(function(){
            if(${loginMember != null}){
                connectWs();
            }
        })


        function connectWs(){
            console.log("tttttt")
            let ws = new SockJS(contextPath+"/alarm");
            socket = ws;

            ws.onopen = function() {
                console.log('open');
            };

            ws.onmessage = function(event) {
                console.log("onmessage"+event.data);

                // let $socketAlert = $('div#socketAlert');
		        // $socketAlert.html(event.data)
                // socketAlert.setAttribute('display', 'block');
                
                const socketAlert = document.getElementById('socketAlert');
                socketAlert.setAttribute('style', 'display:block');
                socketAlert.innerHTML = event.data;


                alarmList

                setTimeout(function(){
                      socketAlert.innerHTML="";
                      socketAlert.setAttribute('style', 'display:none');
                }, 10000);
            };

            ws.onclose = function() {
                console.log('close');
            };
        };
        //소켓끝


    function alarmList(){
        $.ajax({
            url : contextPath + "/AlarmList",  
            data : { "memberId" : memberId }, 
            type : "GET", 
            dataType : "JSON",
            success : function(aList){ 

                const socketAlet2= document.getElementById('socketAlet2');

                const br = document.createElement('br');
                
                for(let alarm of aList){
                    
                    socketAlet2.append(br);

                    if(alarm.boardName =='favorites'){
                        socketAlet2.innerHTML+= '회원님의 상품이 찜 되었습니다.';

                    }else if(alarm.boardName =='inquire'){
                        socketAlet2.innerHTML+= '회원님이 문의를 작성하였습니다.';

                    }else if(alarm.boardName =='chat'){
                        socketAlet2.innerHTML+= '회원님에게 포도톡이 왔습니다.';

                    }else if(alarm.boardName =='update'){
                        socketAlet2.innerHTML+= '회원님이 찜 한 상품이 끌올 되었습니다.';

                    }else if(alarm.boardName =='inquireReply'){
                        socketAlet2.innerHTML+= '관리자가 회원님의 문의에 답변하였습니다.';

                    }
                }

                console.log(aList)
            },
            error: function(){
                console.log('알림 리스트를 불러오는데 오류 발생')
            }

        })
    }

    if(memberNo != ''){
        
        (alarmList)();
    }
</script> 
