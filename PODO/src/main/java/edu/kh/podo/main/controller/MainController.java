package edu.kh.podo.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.board.itemBoard.model.vo.Time;
import edu.kh.podo.member.model.service.MemberService;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.MemberArea;

@SessionAttributes({ "loginMember" })
@Controller
public class MainController {

	@Autowired
	private ItemBoardService service;

	private Logger logger = LoggerFactory.getLogger(MainController.class);

	// 검색 조회 
//	@RequestMapping("/main")
//	public String mainForward(String query, RedirectAttributes ra,
//			Model model) {
//
//			if (query == null) {
//
//				List<ItemBoard> itemList = service.selectItemList();
//				model.addAttribute("itemList", itemList);
//
//			} else {
//
//				List<ItemBoard> searchList = service.searchBoard(query);
//				model.addAttribute("itemList", searchList);
//			}
//
//		return "common/main";
//	}

	@RequestMapping("/main")
	public String mainForward( Model model) {

		String path = null;
		
			
			List<ItemBoard> readCountList = service.selectReadCountList();
			model.addAttribute("readCountList", readCountList);
			
			List<ItemBoard> podoList = service.selectPodoList();
			model.addAttribute("podoList", podoList);
			
			List<ItemBoard> freeShopList = service.selectFreeShopList();
			model.addAttribute("freeShopList", freeShopList);
			
			List<ItemBoard> unOpenList = service.selectUnOpenList();
			model.addAttribute("unOpenList", unOpenList);

		return "common/main";
	}
	
	@ResponseBody
	@RequestMapping("/mainItem")
	public String mainItem(String query, RedirectAttributes ra, Model model, int boardNo) {

		List<ItemBoard> itemList = service.selectItemFour(boardNo);

		return new Gson().toJson(itemList);
	}

	
	@ResponseBody
	@RequestMapping("/mainDistItem")
	public String mainDistItem(HttpSession session ) {
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			int memberNo = loginMember.getMemberNo();
			int distance = loginMember.getDistance();
			
			Map<String, Object> distMap = new HashMap<String, Object>();
			
			distMap.put("memberNo", memberNo);
			distMap.put("distance", distance);
			
			List<ItemBoard> distList = service.selectDistList(distMap);
			
			return new Gson().toJson(distList);
			
		}
		return "{}";
	}
}
	
//	@ResponseBody
//	@RequestMapping("/mainDistItem")
//	public String mainDistItem(@ModelAttribute("loginMember")Member loginMember, String query, RedirectAttributes ra, Model model, int boardNo) {
//		
//		List<ItemBoard> distList = service.selectDistList(loginMember);
//		
//			model.addAttribute("distList", distList);
//
//		return "common/main";
//	}
//}
