package edu.kh.podo.chat.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatMessage;
import edu.kh.podo.chat.model.vo.ChatRoom;

public interface ChatService {

	/** 채팅방 목록 조회 Service
	 * @param memberNo
	 * @return chatRoomList
	 */
	List<ChatList> selectChatRoomList(int memberNo);

	/** 채팅방 상세조회 ajax Service
	 * @param memberNo
	 * @param chatNo
	 * @return chatDetailList
	 */
	Map<String, Object> selectChatDetail(int memberNo, int chatNo);

	/** 1:1 채팅하기(채팅 생성) Service
	 * @param memberNo
	 * @param myMemberNo
	 * @param boardNo
	 * @return result
	 */
	int startChat(int memberNo, int myMemberNo, int boardNo);

	/** 채팅 메세지 삽입 Service
	 * @param chatMessage
	 * @return result
	 */
	int insertMessage(ChatMessage chatMessage);

	/** 채팅방 삭제(나가기)
	 * @param chatNo
	 * @return result
	 */
	int deleteChat(int chatNo);

	/** 채팅방 내 후기 작성 Service
	 * @param memberNo
	 * @param report
	 * @param otherMemNo
	 * @param boardNo
	 * @return result
	 */
	int writeReview(int memberNo, String report, int otherMemNo, int boardNo);

}
