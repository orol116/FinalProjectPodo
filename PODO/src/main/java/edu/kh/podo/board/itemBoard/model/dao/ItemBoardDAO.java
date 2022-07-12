package edu.kh.podo.board.itemBoard.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Repository
public class ItemBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	private Logger logger = LoggerFactory.getLogger(ItemBoardDAO.class);

	public List<ItemBoard> searchList(String searchBar) {
		
		List<ItemBoard> searchList = sqlSession.selectList("itemBoardMapper.searchBoard", searchBar);
		
		return searchList;

	}
	
	public int insertBoard(ItemBoard item) {
		return sqlSession.insert("boardMapper.insertBoard",item);

	}
}
