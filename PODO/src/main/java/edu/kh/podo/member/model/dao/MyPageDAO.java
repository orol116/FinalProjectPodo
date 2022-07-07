package edu.kh.podo.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 회원 정보 수정 DAO
	 * @param paramMap
	 * @return result
	 */
	public int updateInfo(Map<String, Object> paramMap) {
		return sqlSession.update("myPageMapper.updateInfo", paramMap);
	}

	/** 회원 비밀번호 변경 DAO
	 * @param pwMap
	 * @return result
	 */
	public int updatePw(Map<String, Object> pwMap) {
		return sqlSession.update("myPageMapper.updatePw", pwMap);
	}

	/** 현재 비밀번호 조회 DAO
	 * @param memberNo
	 * @return currentPw
	 */
	public String selectCurrentPw(int memberNo) {
		return sqlSession.selectOne("myPageMapper.selectCurrentPw", memberNo);
	}

	/** 회원 탈퇴 DAO
	 * @param memberNo
	 * @return result
	 */
	public int secession(int memberNo) {
		return sqlSession.update("myPageMapper.secession", memberNo);
	}

}
