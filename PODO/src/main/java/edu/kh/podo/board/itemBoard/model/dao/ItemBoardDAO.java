package edu.kh.podo.board.itemBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Repository
public class ItemBoardDAO {

	private SqlSessionTemplate sqlSession;

	public int insertBoard(ItemBoard item) {
		return sqlSession.insert("boardMapper.insertBoard",item);
	}
}
