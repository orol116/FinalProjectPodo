package edu.kh.podo.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.MyPageDAO;
import edu.kh.podo.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO dao;
	
	private BCryptPasswordEncoder bcrypt;

	// 회원 정보 수정 Service 구현
	@Override 
	public int updateInfo(Map<String, Object> paramMap) {
		return dao.updateInfo(paramMap);
	}

	// 회원 비밀번호 수정 Service 구현
	@Override
	public int updatePw(Map<String, Object> pwMap) {
		String nowPw = dao.selectCurrentPw((int)pwMap.get("memberPw"));
				
		if (bcrypt.matches((String)pwMap.get("currentPw"), nowPw)) {
			pwMap.put("newPw", bcrypt.encode((String)pwMap.get("newPw")));
			return dao.updatePw(pwMap);
		}
		return 0;
	}

	// 회원 탈퇴 Service 구현
	@Override
	public int secession(Member loginMember) {
		
		String nowPw = dao.selectCurrentPw(loginMember.getMemberNo());
		
		if (bcrypt.matches(loginMember.getMemberPw(), nowPw)) return dao.secession(loginMember.getMemberNo());
		
		return 0;
	}
	
	
	
	
 
	
	

}
