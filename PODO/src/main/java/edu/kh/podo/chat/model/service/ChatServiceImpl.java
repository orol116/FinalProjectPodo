package edu.kh.podo.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.chat.model.dao.ChatDAO;
import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatRoom;
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

}
