package edu.kh.podo.member.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.MemberArea;

public interface MyPageService {

	/** 회원 정보 수정 Service
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap) throws Exception;

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

	/** 찜 상품 조회
	 * @param memberNo
	 * @return favorBoard
	 */
	List<ItemBoard> selectFavorList(int memberNo);

	
	/** 주소 변경
	 * @param crdntMap
	 * @return result
	 */
	int resetAddr(Map<String, Object> crdntMap);

	
	/** 위도 경도 변경
	 * @param crdntMap
	 * @return
	 */
	int resetCrdnt(Map<String, Object> crdntMap);

	
	/** 거리 등록
	 * @param distance
	 * @return
	 */
	int insertDist(MemberArea distance);



}
