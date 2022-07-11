package edu.kh.podo.member.model.service;

import java.util.List;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Review;

public interface MyShopService {

	/** 판매자 판매상품 조회 Service
	 * @param memberNo
	 * @return memberSellList
	 */
	List<ItemBoard> selectMemberShop(int memberNo);

	/** 내 리뷰 조회 Service
	 * @param memberNo
	 * @return reviewList
	 */
	List<Review> selectMemberReview(int memberNo);

}
