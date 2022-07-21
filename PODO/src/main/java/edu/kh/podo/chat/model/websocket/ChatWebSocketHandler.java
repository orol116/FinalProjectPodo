package edu.kh.podo.chat.model.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import edu.kh.podo.chat.model.service.ChatService;
import edu.kh.podo.chat.model.vo.ChatMessage;

public class ChatWebSocketHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChatService service;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

	// 클라이언트와 연결이 완료되고 통신할 준비가 되면 수행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
	}

	// 클라이언트로 부터 텍스트 메세지를 받았을 때 수행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		// 파라미터 값 무시하고 웹 소켓 실행법...
//		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		
		int result = service.insertMessage(chatMessage);
		
		if (result > 0) for (WebSocketSession wss : sessions) wss.sendMessage(new TextMessage(new Gson().toJson(chatMessage))); 
	}

	// 클라이언트와 연결이 종료되면 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
	}
}
