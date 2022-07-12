package edu.kh.podo.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;

@Controller
public class MainController {
	
	@Autowired
	private ItemBoardService service;

	@RequestMapping("/main")
	public String mainForward(Model model) {
		
		List<ItemBoard> itemList = service.selectItemList();
		
		model.addAttribute("itemList", itemList);
	
		return "common/main";
	}
}
