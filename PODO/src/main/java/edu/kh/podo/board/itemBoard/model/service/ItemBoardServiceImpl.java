package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Service
public class ItemBoardServiceImpl implements ItemBoardService{

	@Autowired
	private ItemBoardDAO dao;
	
	
	// 상품명 검색 구현
	@Override
	public List<ItemBoard> itemSearch(String searchBar) {
		
		List<ItemBoard> searchList = dao.searchList(searchBar);
		
		return searchList;
	}
	
}
