package edu.kh.podo.board.category.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.category.model.vo.LargeCategory;
import edu.kh.podo.board.category.model.vo.MiddleCategory;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Repository
public class CategoryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 대분류 카테고리 조회 DAO
	 * @return LCategoryList
	 */
	public List<LargeCategory> selectLCategory() {
		return sqlSession.selectList("categoryMapper.selectLCategory");
	}
	
	/** 중분류 카테고리 조회 DAO
	 * @return MCategoryList
	 */
	public List<MiddleCategory> selectMCategory() {
		return sqlSession.selectList("categoryMapper.selectMCategory");
	}

	/** 카테고리 내 조회 결과 DAO
	 * @param mCategoryNo
	 * @return categoryResult
	 */
	public List<ItemBoard> categoryResultList(int mCategoryNo) {
		return sqlSession.selectList("categoryMapper.categoryResultList", mCategoryNo);
	}
	
	
}
