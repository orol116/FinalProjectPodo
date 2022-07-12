package edu.kh.podo.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.podo.member.model.dao.MemberDAO;
import edu.kh.podo.member.model.vo.Member;

public interface MemberService {

	
	/** 로그인 service
	 * @param inputMember
	 * @return loginMember
	 */
	Member login(Member inputMember);


	
	/** 회원가입 service
	 * @param inputMember
	 * @return
	 */
	int signUp(Member inputMember);



	Member naverLogin(Member inputMember);



	int naverSignUp(Member inputMember);

	


}
