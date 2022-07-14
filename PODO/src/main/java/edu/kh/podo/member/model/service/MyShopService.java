package edu.kh.podo.member.model.service;

import java.util.List;
import java.util.Map;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Review;

public interface MyShopService {

	/** 판매자 판매상품 조회 Service
	 * @param map
	 * @return memberSellList
	 */
	List<ItemBoard> selectMemberShop(int memberNo);

	/** 내 리뷰 조회 Service
	 * @param memberNo
	 * @return reviewList
	 */
	List<Review> selectMemberReview(int memberNo);
	
	/** 내 상점 회원 정보 조회 Service
	 * @param memberNo
	 * @return member
	 */
	List<Member> selectMemberInfo(int memberNo);

	/** 내 상점 판매 상품 개수 조회 Service
	 * @param memberNo
	 * @return boardCount
	 */
	int selectBoardCount(int memberNo);

	/** 내 판매목록 조회
	 * @param map
	 * @return
	 */
	Map<String, Object> selectManageItem(Map<String, Object> map);

}
