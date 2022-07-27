package edu.kh.podo.alarm.model.dao;

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

	
	
	
}