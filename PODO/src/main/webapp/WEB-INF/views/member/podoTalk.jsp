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

    <script src="https://kit.fontawesome.com/a8d6d2b0bf.js" crossorigin="anonymous"></script>

    <%-- 파비콘 --%>
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

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
                    <c:choose>
						
                        <%-- 조회된 게시글 목록이 없을 때 --%>
                        <c:when test="${empty chatRoomList}">
                            <%-- <tr>
                                <td colspan="4">
                                    <img src="${contextPath}/resources/images/icon-not-found.png" alt="아이콘" width="120" height="120"><b>대화목록이 없습니다</b>
                                </td>
                            </tr> --%>
                            <div class="sc-not-found-list">
                                <img src="${contextPath}/resources/images/icon-not-found.png" width="30" height="30"><b>대화목록이 없습니다</b>
                            </div>
                        </c:when>
                        
                        <%-- 조회된 채팅방 목록이 있을 때 --%>
                        <c:otherwise>
                            
                            <c:forEach var="chatList" items="${chatRoomList}">
                                <div class="card-box">
                                    <%-- 클릭 시 우측 채팅창으로 이동 --%>
                                    <div class="chatDiv" id="${chatList.chatNo}" onclick="listClickFn(${chatList.chatNo})">
                                        <li class="chatList">

                                            <c:if test="${chatList.memberProfile == null}">
                                                <%-- 회원 이미지 --%>
                                                <div class="profile">
                                                    <img src="${contextPath}/resources/images/icon-not-found.png" width="30" height="30">
                                                </div>
                                            </c:if>
                                            <c:if test="${chatList.memberProfile != null}">
                                                <%-- 회원 이미지 --%>
                                                <div class="profile">
                                                    <img src="${contextPath}${chatList.memberProfile}"  width="30" height="30">
                                                </div>
                                            </c:if>

                                            <div class="info">
                                                <div class="memberNick">${chatList.memberNickname}</div><%-- 회원 닉네임 --%>
                                                <div class="sentDate">${chatList.messageTime}</div><%-- 전송날짜 --%>
                                            </div>
                                        </li>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
					</c:choose>
                    
                </ul>
            </section>

            <%-- -------------------------------------------------------------------------------------------------- --%>

            <%-- 우측 채팅창 영역 --%>
            <section class="right-main">

                <c:choose>
						
                    <%-- 조회된 게시글 목록이 없을 때 --%>
                    <c:when test="${empty chatRoomList }">
                        <%-- <tr>
                            <td colspan="4">
                                <img src="${contextPath}/resources/images/icon-not-found.png" alt="아이콘" width="120" height="120"><b>대화방을 선택해주세요</b>
                            </td>
                        </tr> --%>
                        <div class="sc-not-found-room">
                            <img src="${contextPath}/resources/images/icon-not-found.png" alt="아이콘" width="120" height="120"><b>대화방을 선택해주세요</b>
                        </div>
                    </c:when>

                    <c:otherwise>

                        <%-- 연결된 채팅 회원 정보 헤더 --%>
                        <div class="chat-header">
                            
                            <a href="" target="_blank" rel="noopener noreferrer">
                                <%-- 회원 프로필 이미지 --%>
                                <div class="image-box">
                                    <div class="image-table">
                                        <img id="boardimg" src="" style="width: 50px">
                                        <span id="boardTitle">
                                    </div>
                                </div>
                                <%-- 회원 정보(닉네임) --%>
                                <div class="info">
                                    <div>
                                        <span>${member.memberNickname}</span>    
                                    </div>
                                </div>
                            </a>

                            <button type="button" onclick="deleteChat()">나가기</button>
                            <button type="button" onclick="tradeCondition()">판매완료하기</button>

                            <%-- 신고하기 --%>
                            <div class="declaration">
                                <div>
                                    <img id="item-report" src="${contextPath}/resources/images/report.png" alt="신고 이미지">
                                </div>
                            </div>

                            <!-- <%-- 모달창 --%> -->
                            <div class="background">
                                <div class="window">
                                <div class="popup">
                                    <button id="close" type="button">팝업닫기</button>
                                    <div id="report-text">신고할 내용을 입력해주세요.</div>
                                    <div id="report-area">
                                        <textarea id="report" placeholder="신고할 내용을 입력해주세요."></textarea>   
                                    </div>
                                    <div id="selectBtn-area">
                                        <select name="key" id="search-key">
                                            <option value="기타">기타</option>
                                            <option value="광고">광고</option>
                                            <option value="상품 정보 부정확">상품 정보 부정확</option>
                                            <option value="거래 금지 품목">거래 금지 품목</option>
                                            <option value="허위 매물">허위 매물</option>
                                            <option value="사기 의심">사기 의심</option> 
                                        </select>
                                        <button id="introChange">수정하기</button>
                                        <button id="reportBtn">신고하기</button>
                                    </div>

                                </div>
                                <div>
                                </div>
                                </div>
                            </div>

                        </div>



                        <%-- 채팅창 --%>
                        <div class="chatting-area">

                            <%-- 채팅창 영역 --%>
                            <ul class="display-chatting">
    
                                <%-- 조회된 채팅방 목록이 있을 때 --%>
                                
                                <!-- <c:forEach items="${map.chatContent}" var="msg">

                                    <fmt:formatDate var="chatDate" value="${msg.messageTime}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>

                                    <c:if test="${msg.memberNo == loginMember.memberNo }">
                                        <li class="myChat">
                                            <span class="chatDate">${messageTime}</span>
                                            <p class="chat">${msg.messageContent}</p>
                                        </li>
                                    </c:if>
                                    
                                    <c:if test="${msg.memberNo != loginMember.memberNo }">
                                        <li>
                                            <b>${msg.memberNickname}</b><br>
                                            <p class="chat">${msg.messageContent}</p>
                                            <span class="chatDate">${messageTime}</span>
                                        </li>
                                    </c:if>

                                </c:forEach> -->
                            </ul>	
                        

                            <%-- 전송 버튼 --%>
                            <div class="chat-footer">
                                <div class="chat-footer-area">
                                    <%-- <div class="chat-input" contenteditable="true" placeholder="메세지를 입력해주세요."></div> --%>
                                    <textarea id="inputChatting" rows="3" placeholder="메세지를 입력해주세요."></textarea>
                                    <button type="send" id="send">전송</button>
                                </div>
                            </div>

                        </div>
                    </c:otherwise>
                    
                </c:choose>

            </section>

        </div>
        
    </section>



    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
    <script>
		const memberNo = "${loginMember.memberNo}";
		const memberNickname = "${loginMember.memberNickname}";
		const chatNo = "${chatNo}";
        const createChatNo = "${createChatNo}";
		// 로그인이 되어 있을 경우에만
		// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		let chattingSock = new SockJS(contextPath+"/chat");
	</script>
 
    <%-- js --%>
    <script src="${contextPath}/resources/js/chat.js"></script>
    
</body>
</html>