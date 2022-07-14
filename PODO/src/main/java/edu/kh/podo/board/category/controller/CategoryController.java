package edu.kh.podo.board.category.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.podo.board.category.model.service.CategoryService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@ResponseBody
	@GetMapping("/selectCategory")
	public String selectCategory(int mCategoryNo
							   , Model model) {
		
		List<ItemBoard> itemList = service.categoryResultList(mCategoryNo);
		model.addAttribute("itemList", itemList);
		
		return new Gson().toJson(itemList);
	}
	

}
