package edu.kh.podo.member.model.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
//import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.podo.member.model.dao.MemberDAO;
import edu.kh.podo.member.model.vo.Member;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	private Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	// 로그인 service 구현
	@Override
	public Member login(Member inputMember) {

		logger.info(inputMember.getMemberPw() + " / " + bcrypt.encode(inputMember.getMemberPw()));

		Member loginMember = dao.login(inputMember);

		if (loginMember != null) { 

		
			if (bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
			

				loginMember.setMemberPw(null); 

			} else { 
				loginMember = null;

			}
		}

		return loginMember;
	}
	
	@Override
	public Member naverLogin(Member inputMember) {

		return dao.login(inputMember);
	}

	// 회원가입 service 구현
	@Override
	public int signUp(Member inputMember) {

		String encPw = bcrypt.encode(inputMember.getMemberPw());

		inputMember.setMemberPw(encPw);

		int result = dao.signUp(inputMember);

		return result;
	}

	@Override
	public int naverSignUp(Member inputMember) {
		
		int result = dao.naverSignUp(inputMember);

		return result;
	}


	// 핸드폰 본인 인증 구현
	@Override
	public void certifiedPhoneNumber(String memberTel, int randomNumber) {
		String api_key = "NCSJGMRCZSGCLY0V";
	    String api_secret = "YN5NRFZEPLHHJP2DGU8AB3I7NENZZX4P";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", memberTel);    
	    params.put("from", "01054951545");    
	    params.put("type", "SMS");
	    params.put("text", "[PODO] 인증번호는" + "["+randomNumber+"]" + "입니다."); 
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}

	// 아이디 중복체크 구현
	@Override
	public int idDupCheck(String memberId) {
		
		return dao.idDupCheck(memberId);
	}

	// 닉네임 중복체크 구현
	@Override
	public int nicknameDupCheck(String memberNickname) {
		
		return dao.nicknameDupCheck(memberNickname);
	}

	
	
	// 아이디 찾기 구현
	@Override
	public List<Member> findId(Member inputMember) {
		
		return dao.findId(inputMember);
	}

	// 비밀번호 찾기 구현
	@Override
	public String findPw(Member inputMember) {
		
		return dao.findPw(inputMember);
	}

	// 비밀번호 찾기 아이디 조회 
	@Override
	public String searchId(String memberId) {
	
		return dao.searchId(memberId);
	}



	// 비밀번호 재설정(아이디)
	@Override
	public int resetPw(Member inputMember) {
		
		String encPw = bcrypt.encode(inputMember.getMemberPw());

		inputMember.setMemberPw(encPw);

		int result = dao.resetPw(inputMember);	
		
		return result;
	}



	
}
