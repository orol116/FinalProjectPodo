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

	@Override
	public int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath) {
		
		item.setBoardTitle(Util.XSSHandling(item.getBoardTitle()));
		item.setBoardContent(Util.XSSHandling(item.getBoardContent()));
		
		item.setBoardContent(Util.newLineHandling(item.getBoardContent()));
		
		int result = dao.insertBoard(item);
		
		return 0;
	}
	
	
}
