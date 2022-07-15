package edu.kh.podo.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.member.model.vo.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	private Logger logger = LoggerFactory.getLogger(MemberDAO.class);
	
	/** 로그인 DAO
	 * @param inputMember
	 * @return loginMember
	 */
	public Member login(Member inputMember) {
		
		Member loginMember = sqlSession.selectOne("memberMapper.login", inputMember);
		
		return loginMember;
	}


	
	/** 회원가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}



	public int naverSignUp(Member inputMember) {
		return sqlSession.insert("memberMapper.naverS2ignUp", inputMember);
	}



	/** 아이디 중복체크 DAO
	 * @param memberId
	 * @return result
	 */
	public int idDupCheck(String memberId) {
		
		return sqlSession.selectOne("memberMapper.idDupCheck",memberId);
	}



	/** 닉네임 중복체크 DAO
	 * @param memberNickname
	 * @return result
	 */
	public int nicknameDupCheck(String memberNickname) {
		
		return sqlSession.selectOne("memberMapper.idDupCheck",memberNickname);
	}

	
	/** 아이디 찾기 DAO
	 * @param inputMember
	 * @return findMember
	 */
	public List<Member> findId(Member inputMember) {
		
		return sqlSession.selectList("memberMapper.findId", inputMember);
	}
	
	
	/** 비밀번호 찾기 DAO
	 * @param inputMember
	 * @return result
	 */
	public int findPw(Member inputMember) {
		
		return sqlSession.selectOne("memberMapper.findPw", inputMember);
	}




}
