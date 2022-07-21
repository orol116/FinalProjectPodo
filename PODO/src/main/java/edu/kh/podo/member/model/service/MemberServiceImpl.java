package edu.kh.podo.member.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
//import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.common.Util;
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

	
	// 1대1 문의글 작성 및 이미지 삽입
	@Override
	public int inquireWrite(Map<String, Object> paramMap, List<MultipartFile> imageList, String webPath, String folderPath) throws IOException {
		
		paramMap.put("boardContent",Util.XSSHandling((String)paramMap.get("boardContent")));
		
		paramMap.put("boardContent",Util.newLineHandling((String)paramMap.get("boardContent")));
	
//		System.out.println(		paramMap.get("boardContent"));
//		System.out.println(paramMap.get("boardTitle"));

		int boardNo = dao.inquireWrite(paramMap);
		
		if(boardNo >0 ) {
			List<BoardImage> boardImageList = new ArrayList<BoardImage>();
			List<String> reNameList = new ArrayList<String>();

			for (int i = 0; i < imageList.size(); i++) {

				if (imageList.get(i).getSize() > 0) { // i번째 요소에 업로드된 이미지가 있을 경우

					String reName = Util.fileRename(imageList.get(i).getOriginalFilename());
					reNameList.add(reName);

					BoardImage img = new BoardImage();
					img.setBoardNo(boardNo);
					img.setImageLevel(i);
					img.setImageOriginal(imageList.get(i).getOriginalFilename());
					img.setImageReName(webPath + reName);

					boardImageList.add(img);
				}
			}
			
			// 분류 작업 종료 후 boardIamgeList가 비어있지 않은 경우 == 파일이 업로드가 된 경우
			if (!boardImageList.isEmpty()) {
	
				int result = dao.insertBoardImageList(boardImageList);
	
				// result == 삽입 성공한 행의 갯수, 단지 0,1이 아니다.
	
				if (result == boardImageList.size()) { // 삽입된 행의 갯수과 업로드 이미지 수가 같을 경우
	
					// 이제야 서버에 이미지를 저장한다.
	
					for (int i = 0; i < boardImageList.size(); i++) {
	
						int index = boardImageList.get(i).getImageLevel();
	
							imageList.get(index).transferTo(new File(folderPath + reNameList.get(i)));
						
						// imageList에는 multipartFile로 된 실제로 삽입된 이미지가 존재한다.
						// 그것을 파일로 변화해서 업로드를 하는 것이다.
						// 1. 우선 이미지 리스트에 파일을 저장한다. 파일이 비어있더라도 받아온다.
						// 2. 이것을 파일이 존재하는 것만 boardImageList에 저장한다. 이 때, 경로 webPath가 붙어서 이동한다.
						// 3. reNameList는 바뀐 이름을 저장한다.
					}
				}else{
	
				}
			}
		}
		
		return boardNo;
	}

	// 본인이 쓴 문의글 수 조회
	@Override
	public int inquireCount(int memberNo) {
		return dao.inquireCount(memberNo);
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
