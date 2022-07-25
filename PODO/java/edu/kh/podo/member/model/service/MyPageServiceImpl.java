package edu.kh.podo.member.model.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.common.Util;
import edu.kh.podo.member.model.dao.MyPageDAO;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.MemberArea;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 회원 정보 수정 Service 구현
	@Override 
	public int updateInfo(Map<String, Object> paramMap) throws Exception {
		
		MultipartFile uploadImage = (MultipartFile)paramMap.get("uploadImage");
		String delete = (String)paramMap.get("delete");
		String renameImage = null;
		
		if (delete.equals("0")) {
			renameImage = Util.fileRename(uploadImage.getOriginalFilename());
			paramMap.put("profileImage", paramMap.get("webPath") + renameImage); 
		} else {
			paramMap.put("profileImage", null);
		}
		
		int result = dao.updateInfo(paramMap);
		
		if (result > 0 && paramMap.get("profileImage") != null) {
			uploadImage.transferTo(new File(paramMap.get("folderPath") + renameImage));
		}
		
		return result;
	}

	// 회원 비밀번호 수정 Service 구현
	@Override
	public int updatePw(Map<String, Object> pwMap) {
		String nowPw = dao.selectCurrentPw((int)pwMap.get("memberNo"));
				
		if (bcrypt.matches((String)pwMap.get("pw"), nowPw)) {
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

	// 찜 상품 조회
	@Override
	public List<ItemBoard> selectFavorList(int memberNo) {
		return dao.selectFavorList(memberNo);
	}

	// 주소 변경
	@Override
	public int resetAddr(Map<String, Object> crdntMap) {
		
		return dao.resetAddr(crdntMap);
	}

	// 위도 경도 변경
	@Override
	public int resetCrdnt(Map<String, Object> crdntMap) {
		
		return dao.resetCrdnt(crdntMap);
	}

	// 거리 등록
	@Override
	public int insertDist(MemberArea distance) {
		
		return dao.insertDist(distance);
	}

	
	

}
