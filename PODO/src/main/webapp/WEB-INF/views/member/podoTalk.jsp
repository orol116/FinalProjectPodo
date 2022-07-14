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

</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- 사이드 메뉴 -->
    <jsp:include page="/WEB-INF/views/common/sideMenu.jsp" />
    
    
    <!-- 채팅 -->
    <%-- <section class="content">

        <div class="main_area">
            <!-- 좌측 -->
            <div class="left_main">

                <div class="left_main_header">
                    <div class="title">포도톡</div>
                </div>

                <ul>
                    <div class="card_box active">
                        <a href="/messages/00000000000022055476">
                            <li>
                                <div class="profile">
                                    <img src="https://ccimg.hellomarket.com/images/2019/member_profile/07/08/17/3614_660257_1.jpg?size=s4" alt="조자룡2">
                                </div>
                                <div class="info">
                                    <div class="nick">조자룡2</div>
                                    <div class="description">궁금하신점 있으시면 편하게 여쭤보세요</div>
                                    <div class="time_ago">7월2일</div>
                                </div>
                            </li>
                        </a>
                        <div class="etc_dots"></div>
                    </div>
                    <div class="card_box"><a href="/messages/00000000000022045529">
                        <li>
                            <div class="profile">
                                <img src="https://ccimg.hellomarket.com/images/2017/member_profile/s4/04/10/11/2139_53080_1.png?size=s4" alt="헬로마켓_알림">
                            </div>
                            <div class="info">
                                <div class="nick">헬로마켓_알림</div>
                                <div class="description">(헬로마켓)</div>
                                <div class="time_ago">6월30일</div>
                            </div>
                        </li>
                    </a>
                    <div class="etc_dots"></div>
                </div>
            </ul>
            
        </div>

        <!-- 우측 채팅 내역 -->
        <div class="right_main">
            <div class="chat_header">
                <a href="https://www.hellomarket.com/s/660257" target="_blank" rel="noopener noreferrer">
                    <div class="image_box">
                        <div class="image_table">
                            <img src="https://ccimg.hellomarket.com/images/2019/member_profile/07/08/17/3614_660257_1.jpg?size=s4" alt="조자룡2님의 프로필 이미지">
                        </div>
                    </div>
                    <div class="info">
                        <div>
                            <span>조자룡2</span>
                            <span>판매아이템 11개</span>
                        </div>
                    </div>
                </a>
                <div class="declaration">
                    <div>
                        <img src="https://ccimage.hellomarket.com/web/2019/chat/btn_hellotalk_report_x2.png" alt="신고 이미지"></div>
                    </div>
                    <a href="/messages">
                        <div class="chat_close"></div>
                    </a>
                </div>
                <div class="chat_description" style="bottom: 49px;">
                    <div>
                        <div class="chat_timeago">
                            <div class="chat_timeago_box">
                                <span class="chat_timeago_text">2022년 07월 02일</span>
                            </div>
                        </div>
                        <div class="chat_opponent">
                            <div class="chat_opponent_box">
                                <div class="chat_opponent_image_box">
                                    <img class="chat_opponent_profile_image" src="https://ccimg.hellomarket.com/images/2019/member_profile/07/08/17/3614_660257_1.jpg?size=s4" alt="상대방이미지">
                                </div>
                                <div class="chat_opponent_title">조자룡2</div>
                                <div class="chat_opponent_message">
                                    <span>반가워요</span>
                                    <div class="chat_opponent_timeago">오후 7:44</div>
                                </div>
                            </div>
                        </div>
                        <div class="chat_opponent">
                            <div class="chat_opponent_box">
                                <div class="chat_opponent_image_box">
                                    <img class="chat_opponent_profile_image" src="https://ccimg.hellomarket.com/images/2019/member_profile/07/08/17/3614_660257_1.jpg?size=s4" alt="상대방이미지"></div>
                                    <div class="chat_opponent_title">조자룡2</div>
                                    <div class="chat_opponent_message">
                                        <span>궁금하신점 있으시면 편하게 여쭤보세요</span>
                                        <div class="chat_opponent_timeago">오후 7:48</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chat_footer">
                        <div class="chat_footer_area">
                            <div class="chat_input" contenteditable="true" placeholder="메세지를 입력해주세요."></div>
                            <button type="button">전송</button>
                        </div>
                    </div>
                </div>
            </div>
        </section> --%>


    <!-- 채팅 아이콘 -->
    <div class="chatIcon font_jua">
        <img src="resources/images/favicon.ico" class="iconImg">
    </div>

    <!-- 채팅 창 -->
    <div class="chatContainer display-none">
        <div class="chatTop">
            <div class="floatLeft" id="loginOn">
                <img class="profile_img" id="setPic"><!-- src 사진 경로 동적 생성 -->
            </div>
            <div class="name_container font_noto" id="setName"><!-- 이름 동적 생성 --></div>
            <div class="floatRight">
                <img src="resources/img/chat-close.png" class="btnImg close">
            </div>
            <div class="floatRight">
                <img src="resources/img/chat-minus.png" class="btnImg down">
            </div>
        </div>
        <div class="chatMiddle">
            <ul>
                <!-- 동적 생성 -->
            </ul>
        </div>
        <div class="chatBottom">
            <textarea placeholder="메세지를 입력해 주세요."></textarea>
        </div>
    </div>


    <!-- format -->
    <div class="chatMiddle format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>
 
    <!-- 채팅 리스트 -->
    <div class="chatListContainer font_jua display-none">
        <div class="chatTop">
            <div style="padding: 10px; margin-left: 4px;">포도톡 리스트</div>
        </div>
        <div class="chatList">
            <!-- 동적 생성 -->
        </div>
    </div>

    <!-- footer include -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script>
        const contextPath = "${contextPath}";
    </script>

    <%-- js --%>
    <script src="${contextPath}/resources/js/podoTalk.js"></script>

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    
</body>
</html>