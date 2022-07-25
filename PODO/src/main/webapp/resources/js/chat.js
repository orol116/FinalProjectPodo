var chattingNo = 0;
var boardNo1 = 0;
var otherMemNo = 0;
var reviewCount = 0;


// 채팅 목록 클릭 시 채팅방 상세조회 (채팅방 입장 개념)
function listClickFn(chatNo) {

	document.getElementsByClassName("display-chatting")[0].innerHTML = "";
	/* document.getElementsByClassName("chat-body")[0].innerHTML = ""; */

	var bg = document.getElementsByClassName("chatDiv");

	for(var i=0; i<bg.length; i++){
		bg[i].style.backgroundColor="rgb(144, 5, 195)";
	}

	/* $("chatDiv").removeClass();
	$(this).addClass("on"); */

	/* document.getElementsByClassName("chatDiv");	
	$(this).style.backgroundColor="rgb(144, 5, 195)"; */
	
	console.log(chatNo);

	$.ajax({
		url : contextPath + "/chat/chatDetail",
		data : { "chatNo" : chatNo },
		type : "GET",
		dataType : "JSON",

		success : function(data) {

			console.log(data);
			
			// // 이미지 연결
			console.log(data.boardImageList[0].imageReName);

			var img = document.getElementById("boardimg");
			img.src = contextPath + data.boardImageList[0].imageReName;

			document.getElementById("boardTitle").innerText = data.itemList[0].boardTitle;

			const chatContent = data.chatContent;
			console.log(data.chatContent);
			
			for(let msg of data.chatContent){		

				const li = document.createElement("li"); /* 채팅 영역 */
				
				const span = document.createElement("span");
				span.classList.add("chatDate");

				const p = document.createElement("p");
				p.classList.add("chat");
				
				// 내가 쓴 채팅일 경우
				if ( msg.memberNo == memberNo ) {
			
					li.append(span, p);
					li.classList.add("myChat"); // 스타일 적용
					span.innerText = currentTime(); // 날짜
					p.innerHTML = msg.messageContent;
				}else{
					li.innerHTML = "<b>"  + msg.memberNickname  +  "</b><br>";
					p.innerHTML = msg.messageContent;				
					span.innerText = currentTime();
					li.append(p, span);
				}
				
				const display = document.getElementsByClassName("display-chatting")[0];
				
				display.append(li);
				display.scrollTop = display.scrollHeight;

				if (msg.memberNo != memberNo) {
					otherMemNo = msg.memberNo;
				}
			}
			console.log("boardNo : " + data.boardNo);
			chattingNo = chatNo;
			boardNo1 = data.boardNo;
			reviewCount = data.reviewCount;

			console.log("review : " + reviewCount);


			if (data.sellMemNo == memberNo) {
				document.getElementById("finishTrade").style.display = '';
				document.getElementById("reviewWrt").style.display = 'none';
			} else {
				document.getElementById("finishTrade").style.display = 'none';
				if (data.condition == "판매완료") document.getElementById("reviewWrt").style.display = '';
				else document.getElementById("reviewWrt").style.display = 'none';
			}
			
		},

		error : function() {
			alert("에러 발생");
		}
	});

}

/* (function(){

	$(".card-box").click(function(){

		var bg = document.getElementsByClassName("card-box");
		bg.style.backgroundColor='red';
		
	});

})();  */


/* 프로필 헤더 모달 리스트 아이콘 */
$(document).ready(function(){
    $('#spreadBtn04').click(function(){
        if($("#hiddenList03").is(":visible")){
            /* $("#spreadBtn04").toggleClass("icon-emo-sunglasses icon-emo-grin"); */
      	    $("#hiddenList03").slideUp();
        }else{
            /* $("#spreadBtn04").toggleClass("icon-emo-grin icon-emo-sunglasses"); */
	   		$("#hiddenList03").slideDown();
        }
    });
});


// -------------------------------------------------------------------------

// 페이지 로딩 완료 시 채팅창을 제일 밑으로 내리기
(function(){

	const display = document.getElementsByClassName("display-chatting")[0];
	
	if(display != null){
		display.scrollTop = display.scrollHeight;
	}

})();



// 채팅 메세지 보내기
document.getElementById("send").addEventListener("click", sendMessage);


// 채팅 보내기 함수
function sendMessage(){

	// 채팅이 입력되는 textarea
	const inputChatting = document.getElementById("inputChatting"); 

	if(inputChatting.value.trim().length == 0){
		// 입력이 되지 않은 경우
		alert("채팅을 입력해주세요.");
		
		inputChatting.value = ""; // 공백문자 삭제
		inputChatting.focus();

	} else{
		// 입력이 된 경우

		// 메세지 입력 시 필요한 데이터를 js객체로 생성
		const chatMessage = {
			"chatNo" : chattingNo,
			/* "boardNo" : boardNo, */
			"memberNo" : memberNo,
			"memberNickname" : memberNickname,
			"messageContent" : inputChatting.value
		};


		// JSON.parse(문자열) : JSON -> JS Object
		// JSON.stringify(객체) :  JS Object -> JSON
		//console.log(chatMessage);
		//console.log(    JSON.stringify(chatMessage)   );

		// chattingSock(웹소켓 객체)을 이용하여 메세지 보내기
		// chattingSock.send(값) : 웹소켓 핸들러로 값을 보냄
		chattingSock.send( JSON.stringify(chatMessage) );

		console.log("메세지 보내기 성공");

		inputChatting.value = ""; // 입력된 채팅 내용 삭제
	}
}

// 웹소켓 핸들러에서
// s.sendMessage( new TextMessage(message.getPayload()) );
// 구문이 수행되어 메세지가 전달된 경우

chattingSock.onmessage = function(e){
	// 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체
	// e.data : 전달된 메세지 (message.getPayload())   (JSON 형태)

	// 전달 받은 메세지를 JS 객체로 변환
	const chatMessage = JSON.parse(e.data);  // JSON -> JS Object
	console.log(chatMessage);


	const li = document.createElement("li");
	const p = document.createElement("p");
	p.classList.add("chat");
	
	// 줄바꿈
	/* p.innerHTML = chatMessage.message.replace(/\\n/gm , "<br>" ) ; */
	
	// 내용
	const span = document.createElement("span");
	span.classList.add("chatDate");
	//span.innerText = chatMessage.createDate; // 날짜
	span.innerText = currentTime(); // 날짜

	// 내가 쓴 채팅 : span -> p
	
	// 남이 쓴 채팅 : p -> span

	// 내가 쓴 채팅일 경우
	if( chatMessage.memberNo ==  memberNo ){
		li.append(span, p);
		li.classList.add("myChat"); // 내가 쓴 글 스타일 적용
		span.innerText = currentTime(); // 날짜
		p.innerHTML = chatMessage.messageContent;

	}else{
		li.innerHTML = "<b>"  + chatMessage.memberNickname  +  "</b><br>";
		p.innerHTML = chatMessage.messageContent;				
		span.innerText = currentTime();
		li.append(p, span);
	}


	// 채팅창
	const display = document.getElementsByClassName("display-chatting")[0];

	// 채팅창에 채팅 추가
	display.append(li);

	// 채팅창 제일 밑으로 내리기
	display.scrollTop = display.scrollHeight;
	// scrollTop : 스크롤 이동
	// scrollHeight : 스크롤되는 요소의 전체 높이
}



// 현재 시간 출력 함수
function currentTime(){
	const now = new Date();

	const time = now.getFullYear() + "년 " 
			   + addZero( now.getMonth() + 1 ) + "월 "
			   + addZero( now.getDate() ) + "일 "
			   + addZero( now.getHours()  ) + ":" 
			   + addZero( now.getMinutes() ) + ":" 
			   + addZero( now.getSeconds() ) + " "; 

	return time;
}

// 10보다 작을 경우 앞에 0을 붙이는 함수
function addZero(temp){
	return temp < 10 ? "0" + temp : temp;;
}


function deleteChat() {
	
	console.log(chattingNo);

	$.ajax({
		url : contextPath + "/chat/deleteChat",
		data : { "chatNo" : chattingNo },
		type : "GET",

		success : function(result) {

			if (result > 0) {
				console.log(chattingNo);
				console.log("채팅방 나가기 성공");
				location.reload();
			} else {
				console.log("채팅방 나가기 실패");
			}


		},

		error : function() {
			alert("에러 발생");
		}
	});

}

// 신고 && 후기 모달
const searchKey = document.getElementById("search-key");


function show() {
    document.getElementById("reviewBtn").style.display = "none";
    document.getElementById("reportBtn").style.display = "block";
    document.querySelector(".background").className = "background show";
    document.getElementById("report-text").innerText = "";
    document.getElementById("report-text").innerText = "신고할 내용을 입력해주세요.";
    document.getElementById("report").setAttribute("placeholder", "신고할 내용을 입력해주세요.");
    searchKey.style.display = "block";

  }

  function close() {
    document.querySelector(".background").className = "background";
  }

  function reviewShow(){
	
	if (reviewCount == 0) {

		document.getElementById("reviewBtn").style.display = "block";
		document.getElementById("reportBtn").style.display = "none";
		document.querySelector(".background").className = "background show";
		document.getElementById("report-text").innerText = "";
		document.getElementById("report-text").innerText = "후기 작성";
		document.getElementById("report").setAttribute("placeholder", "작성할 후기를 입력해주세요.");
		searchKey.style.display = "none";
		document.getElementById("reviewBtn").style.marginLeft = "350px";
	} else {
		alert("이미 후기 작성이 완료된 판매글입니다.");
	}

  }

  document.querySelector("#reviewWrt").addEventListener("click", reviewShow);
  document.querySelector("#item-report").addEventListener("click", show);
  document.querySelector("#close").addEventListener("click", close);

  const report = document.getElementById("report");

  // 신고 ajax
  document.getElementById("reportBtn").addEventListener("click", function(){

    $.ajax({
        url : "report", 
        data : { "memberNo" : memberNo, "report" : report.value},
        type : "GET", 

        success : function(result){
            alert("신고되었습니다.");
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });


  });

  // 후기 ajax
  function writeReviewFn(){

    $.ajax({
        url : contextPath + "/chat/review", 
        data : { "memberNo" : memberNo, 
				 "report" : report.value,
				 "otherMemNo" : otherMemNo,
				 "boardNo" : boardNo1},
				// reviewCondition 추가해줘야함(data).
        type : "GET", 
        success : function(result){
            alert("후기가 등록되었습니다.");
			location.reload();
        },
        
        error : function(req, status, error){
            console.log(req.responseText);
        }
    });


  }




// 판매완료 처리
function tradeCondition(){

    
    console.log(boardNo1);

    $.ajax({
        url : contextPath + "/shop/main/tradeCondition",

        data : {"boardNo" : boardNo1,
                "condition" : '판매완료'},

        type: "POST",

        success : function(result) {
            if (result > 0) {
                alert("상품 상태가 변경되었습니다.");
            } else {
                alert("상태 변경에 실패하였습니다.");
            }
        },

        error : function(){
            alert("에러 발생");
        }

    });

}