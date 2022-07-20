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

	// 채팅방 목록 조회
	@Override
	public List<ChatList> selectChatRoomList(int memberNo) {
		return dao.selectChatRoomList(memberNo);
	}

}
