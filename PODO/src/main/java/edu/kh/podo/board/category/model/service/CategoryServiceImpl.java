package edu.kh.podo.board.category.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.podo.board.category.model.dao.CategoryDAO;
import edu.kh.podo.board.category.model.vo.LargeCategory;
import edu.kh.podo.board.category.model.vo.MiddleCategory;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryDAO dao;

	// 대분류 카테고리 조회 Service 구현
	@Override
	public List<LargeCategory> selectLCategory() {
		return dao.selectLCategory();
	}
	
	// 중분류 카테고리 조회 Service 구현
	@Override
	public List<MiddleCategory> selectMCategory() {
		return dao.selectMCategory();
	}

}
