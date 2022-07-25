package edu.kh.podo.main.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Time;
import edu.kh.podo.member.model.service.MemberService;
import edu.kh.podo.member.model.vo.Member;

@Controller
public class MainController {
	
	@Autowired
	private ItemBoardService service;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping("/main")
	public String mainForward(String query, RedirectAttributes ra, Model model) {
		
		if(query == null) {
			
			List<ItemBoard> itemList = service.selectItemList();
			model.addAttribute("itemList", itemList);
			
		} else {
			
			List<ItemBoard> searchList = service.searchBoard(query);
			model.addAttribute("itemList", searchList);
		}
	
		return "common/main";
	}
	
	@ResponseBody
	@RequestMapping("/mainItem")
	public String mainItem(String query, RedirectAttributes ra, Model model, int boardNo) {
		
		
		List<ItemBoard> itemList = service.selectItemFour(boardNo);
		
		return new Gson().toJson(itemList);
	}
	
	@RequestMapping("/mainDist")
	public String selectDistList(@ModelAttribute("loginMember") Member loginMember) {
	
		List<ItemBoard> distList = service.selectDistList(loginMember);
		
		return "common/main";
	}
	
}
