package edu.kh.podo.board.category.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.podo.board.category.model.vo.LargeCategory;
import edu.kh.podo.board.category.model.vo.MiddleCategory;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

public interface CategoryService {

	/** 대분류 카테고리 목록 조회
	 * @return LCategoryList
	 */
	List<LargeCategory> selectLCategory();
	
	/** 중분류 카테고리 목록 조회
	 * @return MCategoryList
	 */
	List<MiddleCategory> selectMCategory();

	/** 카테고리 별 검색 조회
	 * @param mCategoryNo
	 * @return categoryResult
	 */
	List<ItemBoard> categoryResultList(int mCategoryNo);

	List<MiddleCategory> mcategoryList(int lCategoryNo);

}
