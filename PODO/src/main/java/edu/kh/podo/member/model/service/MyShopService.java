package edu.kh.podo.member.model.service;

import java.util.List;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface MyShopService {

	/** 내 판매상품 조회 Service
	 * @return
	 */
	List<ItemBoard> selectMyShop(int memberNo);

}
