package edu.kh.podo.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.chat.model.vo.ChatList;
import edu.kh.podo.chat.model.vo.ChatRoom;
import edu.kh.podo.member.model.vo.Member;

@Repository
public class ChatDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 채팅방 목록 조회
	 * @param memberNo
	 * @return chatRoomList
	 */
	public List<ChatList> selectChatRoomList(int memberNo) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", memberNo);
	}
}
