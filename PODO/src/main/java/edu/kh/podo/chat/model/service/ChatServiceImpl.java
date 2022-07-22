package edu.kh.podo.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.chat.model.dao.ChatDAO;
import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatMessage;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.common.Util;
import edu.kh.podo.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO dao;

	// 채팅방 목록 조회 Service 구현
	@Override
	public List<ChatList> selectChatRoomList(int memberNo) {
		return dao.selectChatRoomList(memberNo);
	}

	// 채팅방 목록 조회 Service 구현
	@Override
	public Map<String, Object> selectChatDetail(int memberNo, int chatNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("chatNo", chatNo);
		
		// 상대방 채팅 정보 조회
		List<ChatList> otherDetail = dao.selectOtherDetail(map);
		
		// 내 채팅 정보 조회 (대화 내용 / 시간만)
		List<ChatList> myDetail = dao.selectMyDetail(map);
		
		// 반환 Map
		Map<String, Object> rtMap = new HashMap<String, Object>();
		rtMap.put("otherDetail", otherDetail);
		rtMap.put("myDetail", myDetail);
		
		return rtMap;
	}

	// 1:1 채팅하기(채팅 생성) Service 구현
	@Override
	public int startChat(int memberNo, int myMemberNo, int boardNo) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("myMemberNo", myMemberNo);
		map.put("boardNo", boardNo);
		
		// 채팅방이 이미 존재하는지 DAO 호출하여 조회
		int chatNo  = dao.selectChatRoom(map);
		
		if (chatNo == 0) {
			
			// 채팅방 참여 DAO 호출
			chatNo = dao.createChat(map);
			
			dao.joinChat(map);
			
		} else {
			
			// 채팅방이 있다면 삭제되어 있는 방인지 확인 후 
			int check = dao.checkDel(chatNo);
			
			// 삭제되었다면 다시 생성 (상태 변경)
			if (check > 0) {
				dao.updateStatus(chatNo);
			}
		}
		
			
		return chatNo;
	}

	// 채팅 메세지 삽입 Service 구현
	@Override
	public int insertMessage(ChatMessage chatMessage) {
		
		chatMessage.setMessageContent(Util.newLineHandling(chatMessage.getMessageContent()));
		
		return dao.insertMessage(chatMessage);
	}

}
