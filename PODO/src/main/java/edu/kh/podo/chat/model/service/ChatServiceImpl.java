package edu.kh.podo.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.chat.model.dao.ChatDAO;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDAO dao;

	// 채팅방 목록 조회
	@Override
	public List<ChatRoom> selectChatRoomList(int memberNo) {
		
		// 내가 참여중인 채팅방 번호 조회
		List<Integer> chatNoList = dao.selectChatNoList(memberNo);
		
		// 내가 참여중인 채팅방에서 상대방 프로필 조회
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("chatNoList", chatNoList);
		
		List<Member> chatMemberInfo = dao.selectChatMemberInfo(map);
		 
		return null;
	}

}
