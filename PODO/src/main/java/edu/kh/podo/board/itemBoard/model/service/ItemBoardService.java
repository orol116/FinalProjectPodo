package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface ItemBoardService {
	
	/** 상품명 검색 Service
	 * @param searchBar
	 * @return searchList
	 */
	List<ItemBoard> searchBoard(String searchBar);

	int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath);

}
