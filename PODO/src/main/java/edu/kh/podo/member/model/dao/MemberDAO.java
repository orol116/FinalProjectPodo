package edu.kh.podo.member.model.dao;

import java.util.List;
import java.util.Map;

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
		return sqlSession.insert("memberMapper.naverSignUp", inputMember);
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
	public String findPw(Member inputMember) {
		
		return sqlSession.selectOne("memberMapper.findPw", inputMember);
	}



	/** 비밀번호 찾기 아이디 조회 DAO
	 * @param memberId
	 * @return searchId
	 */
	public String searchId(String memberId) {
		
		return sqlSession.selectOne("memberMapper.searchId", memberId);
	}



	public int inquireWrite(Map<String, Object> paramMap) {
		
		int result = sqlSession.insert("memberMapper.inquireWrite",paramMap); // 0 또는 1
		
		if(result>0) {
			
			result = (int) paramMap.get("boardNo"); // 게시글 삽입 성공시 <selectKey> 태그를 이용해 세팅된 boardNo값을 반환함
										  // -> 게시글 번호 사용 가능해짐!
		}
		
		return result;	
	}
	
	/** 비밀번호 재설정(아이디)
	 * @param inputMember
	 * @return
	 */
	public int resetPw(Member inputMember) {
		
		return sqlSession.update("memberMapper.resetPw",inputMember);
	}




}
