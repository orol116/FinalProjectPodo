package edu.kh.podo.board.itemBoard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.itemBoard.model.dao.ItemBoardDAO;

@Service
public class ItemBoardServiceImpl implements ItemBoardService{

	@Autowired
	private ItemBoardDAO dao;
	
	
}
