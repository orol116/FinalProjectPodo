package edu.kh.podo.chat.model.service;

import java.util.List;

import edu.kh.podo.chat.model.vo.ChatRoom;

public interface ChatService {

	/** 채팅방 목록 조회
	 * @param memberNo
	 * @return chatRoomList
	 */
	List<ChatRoom> selectChatRoomList(int memberNo);

}
