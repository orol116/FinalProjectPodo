package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.common.Util;


@Service
public class ItemBoardServiceImpl implements ItemBoardService{

	@Autowired
	private ItemBoardDAO dao;
	
	// 메인화면 상품 조회 Service
	@Override
	public List<ItemBoard> selectItemList() {
		return dao.selectitemList();
	}

	@Override
	public int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath) {
		
		item.setBoardTitle(Util.XSSHandling(item.getBoardTitle()));
		item.setBoardContent(Util.XSSHandling(item.getBoardContent()));
		
		item.setBoardContent(Util.newLineHandling(item.getBoardContent()));
		
		int result = dao.insertBoard(item);
		
		return 0;
	}
	
	
	// 상품명 검색 구현
	@Override
	public List<ItemBoard> itemSearch(String searchBar) {
		
		List<ItemBoard> searchList = dao.searchList(searchBar);
		
		return searchList;
	}


	
	
}
