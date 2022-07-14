package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface ItemBoardService {
	
	
	/** 메인화면 상품 리스트 조회 Service
	 * @return itemList
	 */
	List<ItemBoard> selectItemList();

	
	/** 상품명 검색 Service
	 * @param searchBar
	 * @return searchList
	 */
	List<ItemBoard> searchBoard(String searchBar);

	int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath);


	/** 판매글 상세조회 Service
	 * @param boardNo
	 * @return map
	 */
	Map<String, Object> itemDetail(int boardNo);


	



}
