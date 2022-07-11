package edu.kh.podo.member.model.service;

import java.util.List;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Review;

public interface MyShopService {

	/** 내 판매상품 조회 Service
	 * @param memberNo
	 * @return mySellList
	 */
	List<ItemBoard> selectMyShop(int memberNo);

	/** 내 리뷰 조회 Service
	 * @param memberNo
	 * @return reviewList
	 */
	List<Review> selectReview(int memberNo);

}
