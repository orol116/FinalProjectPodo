package edu.kh.podo.alarm.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.alarm.model.vo.Alarm;

@Repository
public class AlarmDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**Alaram 삽입 dao
	 * @param alarmMessage
	 * @return
	 */
	public int insertMessage(Alarm alarmMessage) {
		return sqlSession.insert("alarmMapper.insertMessage",alarmMessage);
	}

	/** receiver 의 memberNo를 사용해서 receiver의 memberId 를 조회
	 * @param recieverMemberNo
	 * @return
	 */
	public String selectMemberId(int recieverMemberNo) {
		return sqlSession.selectOne("alarmMapper.selectMemberId",recieverMemberNo);
	}

	/**채팅방에 맞는 회원 조회
	 * @param map
	 * @return
	 */
	public String selectRecieverId(Map<String, Object> map) {
		return sqlSession.selectOne("alarmMapper.selectRecieverId",map);
	}

	
	/** 해당 판매글을 찜한 사용자에게 끌올 시 알림
	 * @param boardNo
	 * @return
	 */
	public List<String> selectBuyerId(int boardNo) {
		return sqlSession.selectList("alarmMapper.selectBuyerId",boardNo);
	}

	/** 알림 리스트 조회 
	 * @param memberId
	 * @return
	 */
	public List<Alarm> alarmListSelect(String memberId) {
		  List<Alarm> aList = sqlSession.selectList("alarmMapper.alarmListSelect",memberId);
		  System.out.println(aList);
		  return aList;
	}

	
	
	
	
}
