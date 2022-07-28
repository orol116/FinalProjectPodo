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

    <script src="https://kit.fontawesome.com/35f111b89d.js" crossorigin="anonymous"></script>

    <%-- 파비콘 --%>    
    <link href="${contextPath}/resources/images/favicon.ico" rel="icon">

</head>
<body style="width:auto;">

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
                    <div><p id="podo">&#128235;&nbsp;PODO TALK</p></div>
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

                                            <!-- 이미지가 없을 때 -->
                                            <c:if test="${chatList.memberProfile == null}">
                                                <%-- 회원 이미지 --%>
                                                <div class="profile">
                                                    <img src="${contextPath}/resources/images/user.jpg" width="30" height="30">
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
            <%-- right-main : 채팅영역
                구성 크게 div 3개
                chat-header : 프로필 영역 및 모달
                chat-body : 채팅창
                chat-footer : 채팅메시지 보내기 영역
             --%>

                <c:choose>
						
                    <%-- 조회된 게시글 목록이 없을 때 --%>
                    <c:when test="${empty chatRoomList}">
                        <div class="sc-not-found-room">
                            <img src="${contextPath}/resources/images/icon-not-found.png" alt="아이콘" width="120" height="120"><b>대화방을 선택해주세요</b>
                        </div>
                    </c:when>

                    <c:otherwise>

                        <%-- 연결된 채팅 회원 정보 헤더 --%>
                        <div class="chat-header">
                            
                            <a href="#" target="_blank" rel="noopener noreferrer" id="aTag">
                                <%-- 회원 프로필 이미지 --%>
                                <div class="image-box">
                                    <div class="image-table">
                                        <%-- <img id="boardimg" src="" style="width: 50px"> --%>
                                        <img id="boardimg" src="${contextPath}${boardImageList.imageReName}">
                                        <%-- <span id="boardTitle"> --%>
                                    </div>
                                </div>
                                <%-- 회원 정보(닉네임) --%>
                                <div class="info">
                                    <div>
                                        <span id="boardTitle">
                                        <span>${member.memberNickname}</span>    
                                    </div>
                                </div>
                            </a>

                            

                            <%-- 신고하기 --%>
                            <div class="declaration">

                                

                              
                                <img id="item-report" src="${contextPath}/resources/images/report.png" alt="신고 이미지">


                                
                                <span class="icon-emo-sunglasses" id="spreadBtn04">
                                    <img class="icon-list" src="${contextPath}/resources/images/icon-list.png">
                                </span>
                                
                                <ul id="hiddenList03" class="example01" style="display: none;">
                                    <button type="button" onclick="deleteChat()">나가기</button>
                                    <button type="button" onclick="tradeCondition()" id="finishTrade">판매완료하기</button>
                    
                                    <!-- Button trigger modal -->
                                    <button type="button" id="reviewWrt" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="--bs-btn-bg: rgb(131, 4, 177)">후기 작성</button>
                                </ul>

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
                                            <option value="1">기타</option>
                                            <option value="2">광고</option>
                                            <option value="3">상품 정보 부정확</option>
                                            <option value="4">거래 금지 품목</option>
                                            <option value="5">허위 매물</option>
                                            <option value="6">사기 의심</option> 
                                        </select>
                                        <button id="reportBtn">신고하기</button>
                                        <button id="reviewBtn">등록하기</button>
                                    </div>

                                </div>
                                <div>
                                </div>
                                </div>
                            </div>

                        </div>



                        <%-- 채팅창 --%>
                        <div class="display-chatting">
                        <%-- <div class="chat-body"> --%>

                            <%-- 채팅창 영역 --%>
                            <%-- <ul class="display-chatting"></ul>	 --%>
                        
                        </div>

                        <%-- 전송 버튼 --%>
                        <div class="chat-footer">
                            <div class="chat-footer-area">
                                <textarea id="inputChatting" rows="3" placeholder="메세지를 입력해주세요."></textarea>
                                <button type="send" id="send">전송</button>
                            </div>
                        </div>

                        
                        <!-- bootstrap review Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">후기 작성</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <h1 class="review-title">후기 남기기</h1>

                                    <div class="logo-image">
                                        <img src="${contextPath}/resources/images/logo.png" alt="포도 로고" style="width:300px; height:250px;">
                                    </div>
                            
                                    <h4 class="myPage-subtitle">거래는 어떠셨어요?</h4>
                                        <div class="review-table">
                                            <div class="review-table-title">만족도</div>
                                            <div class="review-table-thumbs">
                                                
                                                <button type="button" class="btn btn-warning " id="like-btn" style="--bs-btn-bg: #0055FF;" onclick="condition1('좋아요')">
                                                    <img src="${contextPath}/resources/images/icon-thumb-up.png">
                                                </button>
                                                <button type="button" class="btn btn-danger" id="dislike-btn" onclick="condition2('아쉬워요')">
                                                    <img src="${contextPath}/resources/images/icon-thumb-down.png">
                                                </button>
                                                        
                            
                                            </div>
                                        </div>
                            
                                        <div class="my-review">
                                            <div class="my-review-title">상세 후기</div>
                            
                                            <div class="my-review-content">
                            
                                                <%-- 후기 내용 --%>
                                                <div class="my-review-content-text-wrap">
                                                    <textarea class="my-review-text-area" id="reviewCon" name="reviewContent" cols="50" rows="10" placeholder="고객님의 솔직한 리뷰를 남겨주세요. (상품과 관련있는 후기 내용만 작성해주세요.)"></textarea>
                                                </div>
                            
                                            </div>

                                        </div>
                                </div>
                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                                <button type="button" class="btn btn-primary" style="--bs-btn-bg: rgb(131, 4, 177)" onclick="writeReviewFn()">등록하기</button>
                                </div>
                            </div>
                            </div>
                        </div>

                       
                    </c:otherwise>
                    
                </c:choose>

            </section>

        </div>
        
    </section>

    <!-- bootstrap modal CDN via jsDelivr -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- https://github.com/sockjs/sockjs-client -->
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    
    <script>
		const chatNo = "${chatNo}";
        const createChatNo = "${createChatNo}";
		// 로그인이 되어 있을 경우에만
		// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
		var chattingSock = new SockJS(contextPath+"/chat");

        var recieveMemberId = "${member.recieveMemberId}";
	</script>
    <%-- js --%>
    <script src="${contextPath}/resources/js/chat.js"></script>
    <script src="${contextPath}/resources/js/member/headCategory.js"></script>
    
</body>
</html>