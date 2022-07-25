package edu.kh.podo.alarm.model.websocket;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.kh.podo.alarm.model.service.AlarmService;
import edu.kh.podo.alarm.model.vo.Alarm;
import edu.kh.podo.member.model.vo.Member;


public class WebSocketHandler extends TextWebSocketHandler{

	private Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	
	@Autowired
	private AlarmService service;

	//로그인 한 전체
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
//	private Set<WebSocketSession> sessions 
//	= Collections.synchronizedSet(new HashSet<WebSocketSession>());
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//클라이언트와 서버가 연결
		sessions.add(session);
		
		// 해당 세션의 멤버 아이디 값을 가져온다.
		String senderId = currentUserId(session);
		
		// 아이디와 세션 값을 가지고 맵에 넣는다. 
		userSessionsMap.put(senderId,session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// 메시지
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		Alarm alarmMessage = objectMapper.readValue(message.getPayload(), Alarm.class);
		
		String msg = message.getPayload();
		logger.info("msg="+msg);
		
		System.out.println(alarmMessage);
		
		// 채팅 메세지 db 삽입
		int result = service.insertMessage(alarmMessage);	
		
		if (result>0) {
			
			if(alarmMessage.getBoardName().equals("inquire")) {
				
				
				String boardWriter = alarmMessage.getMemberId();
				String boardLink = alarmMessage.getBoardLink();
				
				String admin = "test01";
				
//				WebSocketSession boardWriterSession = userSessionsMap.get(boardWriter);
				WebSocketSession adminSession = userSessionsMap.get(admin);
				
				logger.info("boardWriterSession = "+userSessionsMap.get(boardWriter));
				logger.info("adminSession = "+adminSession);
				
				// 실시간 접속 시 
				if ( adminSession != null) {
					logger.info("onmessage되나?");
					TextMessage tmpMsg = new TextMessage(boardWriter + "님이 <a href='podo/admin/3' style=\"color: black\">"
							+ "<strong>문의를 작성하였습니다.</strong></a>");
					adminSession.sendMessage(tmpMsg);
				}else if(alarmMessage.getBoardName().equals("inquire")){
					
				}
				
				
				
			}
		}
			
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//연결 해제
		logger.info("Socket 끊음");
		sessions.remove(session);
	}
	
	// 세션에서 유저 아이디를 가져오는 메소드
	private String currentUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginMember");
		
		if(loginUser == null) {
			String mId = session.getId();
			return mId;
		}
		String mId = loginUser.getMemberId();
		System.out.println("----------------------------------------------------"+mId+"----------------------------------------------------");
		return mId;
		
	}

}
