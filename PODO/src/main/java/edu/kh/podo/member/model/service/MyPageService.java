package edu.kh.podo.member.model.service;

import java.util.Map;

public interface MyPageService {

	/** 회원 정보 수정 Service
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap);

}
