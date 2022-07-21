package edu.kh.podo.chat.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatRoom;

public interface ChatService {

	/** 채팅방 목록 조회
	 * @param memberNo
	 * @return chatRoomList
	 */
	List<ChatList> selectChatRoomList(int memberNo);

	/** 채팅방 상세조회 ajax
	 * @param memberNo
	 * @param chatNo
	 * @return chatDetailList
	 */
	Map<String, Object> selectChatDetail(int memberNo, int chatNo);

}
