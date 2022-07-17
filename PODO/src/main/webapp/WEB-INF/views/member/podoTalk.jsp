<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>포도챗</title>

    <link rel="stylesheet" href="${contextPath}/resources/css/main-style.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage/sideMenu.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/chat.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/chat-style.css">

</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    
    
    <!-- 채팅 -->
    <%-- 본문 영역 --%>
    <section class="content">
		
        <%-- 채팅 전체 영역(리스트+채팅창) --%>
        <div class="main-area">

            <%-- 좌측 채팅 리스트 영역 --%>
            <section class="left-main">
                <%-- 좌측 리스트 박스 영역 --%>
                <ul>
                    <div class="card-box">
                        <%-- 클릭 시 우측 채팅창으로 이동 --%>
                        <a href="">
                            <li>
                                <%-- 회원 이미지 --%>
                                <div class="profile">
                                    <img src="${contextPath}${member.memberProfile}">
                                </div>
                                <div class="info">
                                    <div class="memberNick">${member.memberNickname}</div><%-- 회원 닉네임 --%>
                                    <div class="sentDate">${chatroom.sentDate}</div><%-- 전송날짜 --%>
                                </div>
                            </li>
                        </a>
                    </div>
                </ul>
            </section>

            <%-- -------------------------------------------------------------------------------------------------- --%>

            <%-- 우측 채팅창 영역 --%>
            <section class="right-main">

                <%-- 연결된 채팅 회원 정보 헤더 --%>
                <div class="chat-header">
                    <a href="" target="_blank" rel="noopener noreferrer">
                        <%-- 회원 프로필 이미지 --%>
                        <div class="image-box">
                            <div class="image-table">
                                <img src="${contextPath}${member.memberProfile}">
                            </div>
                        </div>
                        <%-- 회원 정보(닉네임) --%>
                        <div class="info">
                            <div>
                                <span>${member.memberNickname}</span>    
                            </div>
                        </div>
                    </a>
                    <%-- 신고하기 --%>
                    <div class="declaration">
                        <div>
                            <img src="${contextPath}/resources/images/report.png" alt="신고 이미지">
                        </div>
                    </div>
                        <a href="#"><div class="chat_close"></div></a>
                </div>



                <%-- 채팅창 --%>
                <div class="chatting-area" style="bottom: 49px;">

                    <%-- 채팅창 영역 --%>
                    <ul class="display-chatting">
                
                        <c:forEach items="${list}" var="msg">
                            <fmt:formatDate var="chatDate" value="${msg.createDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
                            <c:if test="${msg.memberNo == loginMember.memberNo }">
                                <li class="myChat">
                                    <span class="chatDate">${chatDate}</span>
                                    <p class="chat">${msg.message }</p>
                                </li>
                            </c:if>
                            
                            <c:if test="${msg.memberNo != loginMember.memberNo }">
                                <li>
                                    <b>${msg.memberNickname }</b>	<br>
                                    <p class="chat">${msg.message }</p>
                                    <span class="chatDate">${chatDate}</span>
                                </li>
                            </c:if>
                        
                        </c:forEach>
                    </ul>	
                

                    <%-- 전송 --%>
                    <div class="chat-footer">
                        <div class="chat-footer-area">
                            <%-- <div class="chat-input" contenteditable="true" placeholder="메세지를 입력해주세요."></div> --%>
                            <textarea id="inputChatting" rows="3" placeholder="메세지를 입력해주세요."></textarea>
                            <button type="send">전송</button>
                        </div>
                    </div>
                    
                    
                    
                    
                   <%--  <div class="input-area">
                        <textarea id="inputChatting" rows="3"></textarea>
                        <button id="send">보내기</button>
                    </div> --%>
                </div>

            </section>

        </div>
        
    </section>


    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
<%-- 	<script>
		const memberNo = "${loginMember.memberNo}";
		const memberEmail = "${loginMember.memberEmail}";
		const memberNickname = "${loginMember.memberNickname}";
		const chatRoomNo = "${chatRoomNo}";
		const contextPath = "${contextPath}";

		// 로그인이 되어 있을 경우에만
		// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let chattingSock = new SockJS(contextPath+"/chat");
	</script>
 --%>
    <%-- js --%>
    <script src="${contextPath}/resources/js/chat.js"></script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
</body>
</html>