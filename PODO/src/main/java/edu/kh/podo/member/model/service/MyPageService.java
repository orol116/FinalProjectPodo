package edu.kh.podo.member.model.service;

import java.util.Map;

import edu.kh.podo.member.model.vo.Member;

public interface MyPageService {

	/** 회원 정보 수정 Service
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap);

	/** 회원 비밀번호 수정 Service
	 * @param pwMap
	 * @return result
	 */
	int updatePw(Map<String, Object> pwMap);

	/** 회원 탈퇴 Service
	 * @param loginMember
	 * @return result
	 */
	int secession(Member loginMember);

}
