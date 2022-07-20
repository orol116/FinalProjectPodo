package edu.kh.podo.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Integer> selectChatNoList(int memberNo) {
		return sqlSession.selectList("chatMapper.selectChatNoList", memberNo);
	}

	/** 내가 참여중인 채팅방에서 상대방 프로필 조회
	 * @param map
	 * @return chatMemberInfo
	 */
	public List<Member> selectChatMemberInfo(Map<String, Object> map) {
		return sqlSession.selectList("chatMapper.selectChatMemberInfo", map);
	}

}
