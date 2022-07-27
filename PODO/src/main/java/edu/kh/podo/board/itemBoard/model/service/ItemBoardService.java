package edu.kh.podo.board.itemBoard.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.podo.board.itemBoard.model.vo.BoardImage;
import edu.kh.podo.board.itemBoard.model.vo.Coordinate;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.vo.Member;
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
	List<ItemBoard> searchBoard(String query);

	int insertBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath, Coordinate crdnt) throws IOException;


	/** 판매글 상세조회 Service
	 * @param boardNo
	 * @return map
	 */
	Map<String, Object> itemDetail(int boardNo);


	/** 찜 등록 Service
	 * @param map
	 * @return result
	 */
	int addFav(Map<String, Object> map);

	/** 게시글 찜 개수 +1 Service
	 * @return result
	 */
	int addCountAdd(Map<String, Object> map);


	/** 게시글 수정 Service
	 * @param item
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @param deleteList 
	 * @return result
	 */
	int updateBoard(ItemBoard item, List<MultipartFile> imageList, String webPath, String folderPath, String deleteList) throws IOException;


	/** 수정용 상세조회
	 * @param boardNo
	 * @return item
	 */
	ItemBoard selectBoardDetail(int boardNo);

	List<BoardImage> selectBoardImageList(int boardNo);

	List<ItemBoard> selectItemFour(int boardNo);


	/** 거리별 상품 조회
	 * @param distMap
	 * @return distList
	 */
	List<ItemBoard> selectDistList(Map<String, Object> distMap);
}
