package edu.kh.podo.board.itemBoard.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface ItemBoardService {

	int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath);

}
