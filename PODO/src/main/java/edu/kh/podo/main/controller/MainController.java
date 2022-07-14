package edu.kh.podo.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.service.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private ItemBoardService service;

	@RequestMapping("/main")
	public String mainForward(String searchBar, RedirectAttributes ra, Model model) {
		
		
		if (searchBar == null) {
			
			List<ItemBoard> itemList = service.selectItemList();
			model.addAttribute("itemList", itemList);
		} else {
			
			List<ItemBoard> searchList = service.searchBoard(searchBar);
			model.addAttribute("searchList", searchList);
		}
	
		return "common/main";
	}
	

}
