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

	/** 채팅방 목록 조회 DAO
	 * @param memberNo
	 * @return chatRoomList
	 */
	public List<ChatList> selectChatRoomList(int memberNo) {
		return sqlSession.selectList("chatMapper.selectChatRoomList", memberNo);
	}

	/** 상대방 채팅 정보 조회 DAO
	 * @param map
	 * @return otherDetail
	 */
	public List<ChatList> selectOtherDetail(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectOtherDetail", map);
	}

	/** 내 채팅 정보 조회 (대화 내용 / 시간만) DAO
	 * @param map
	 * @return myDetail
	 */
	public List<ChatList> selectMyDetail(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectMyDetail", map);
	}
}
