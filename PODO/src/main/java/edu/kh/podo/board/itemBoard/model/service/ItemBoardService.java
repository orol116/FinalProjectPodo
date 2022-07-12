package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface ItemBoardService {
	
	/** 상품명 검색 Service
	 * @param searchBar
	 * @return searchList
	 */
	List<ItemBoard> itemSearch(String searchBar);

}
