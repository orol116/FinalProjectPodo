package edu.kh.podo.board.itemBoard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;


@Controller
@RequestMapping("/board")
@SessionAttributes({"loginMember"})
public class ItemBoardController {
	@Autowired
	private ItemBoardService service;

	
	// 상품 상세페이지
		@GetMapping("/detail")
		public String itemDetail() {
			return "/item/item-detail";
		}
		
		@GetMapping("/search")
		public String itemSearch(String searchBar,
								RedirectAttributes ra,
								Model model) {
			
			List<ItemBoard> searchList = service.itemSearch(searchBar);
			
			String path = null;
			
			/*
			 * if(searchList != null) {
			 * 
			 * 
			 * }
			 */
			return "redirect:/";
		}
}
