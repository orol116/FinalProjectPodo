package edu.kh.podo.member.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.chat.model.service.ChatService;
import edu.kh.podo.member.model.service.MemberService;
import edu.kh.podo.member.model.service.MyShopService;
import edu.kh.podo.member.model.vo.Member;
import edu.kh.podo.member.model.vo.Review;

@Controller
@RequestMapping("/shop")
@SessionAttributes({"loginMember"})
public class MyShopController {
	
	@Autowired
	private MyShopService service;
	
	@Autowired
	private ItemBoardService itemService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ChatService chatService;
	
	private Logger logger;

	// 내 상품관리
	@GetMapping("/main")
	public String memberShopMain(ItemBoard itemBoard
							   , @ModelAttribute("loginMember") Member loginMember
							   , @RequestParam(value="cp", required=false, defaultValue="1") int cp
							   , @RequestParam Map<String, Object> paramMap
							   , Model model) {
		
		int memberNo = loginMember.getMemberNo();
		
		paramMap.put("cp", cp);
		paramMap.put("memberNo", memberNo);
		
		int boardCount = service.selectBoardCount(memberNo);
		paramMap.put("boardCount", boardCount);
		
		Map<String, Object> map = service.selectManageItem(paramMap);
		
		model.addAttribute("map", map);
		
		int memGrape = chatService.selectGrape(memberNo);
		model.addAttribute("memGrape", memGrape);
		
		
		return "item/itemManage";
	}
	
//	// 내 상점 조회
//	@GetMapping("/myShop/{memberNo}")
//	public String myShop(@PathVariable("memberNo") int memberNo
//					   , Model model) {
//		
//		List<Member> member = service.selectMemberInfo(memberNo);
//		model.addAttribute("member", member);
//		
//		int boardCount = service.selectBoardCount(memberNo);
//		model.addAttribute("boardCount", boardCount);
//		
//		int reviewCount = service.selectReviewCount(memberNo);
//		model.addAttribute("reviewCount", reviewCount);
//		
//		return "member/profile";
//	}
	
	// 판매자 상점 조회
	@GetMapping("/memberShop/{memberNo}")
	public String memberShop(@PathVariable("memberNo") int memberNo
						   , Model model) {
		
		List<Member> member = service.selectMemberInfo(memberNo);
		model.addAttribute("member", member);
		
		int boardCount = service.selectBoardCount(memberNo);
		model.addAttribute("boardCount", boardCount);
		
		int reviewCount = service.selectReviewCount(memberNo);
		model.addAttribute("reviewCount", reviewCount);
		
		int finItem = service.selectFinItem(memberNo);
		model.addAttribute("finItem", finItem);
		
		return "member/profile";
	}
	
	// 내 상점 물건 조회 ajax
	@ResponseBody
	@GetMapping("/selectItemsList/{memberNo}")
	public String selectItemsList(@PathVariable("memberNo") int memberNo) {
		List<ItemBoard> memberItemList =  service.selectMemberShop(memberNo);
		return new Gson().toJson(memberItemList);
	}
	
	// 내 상점 후기 조회 ajax
	@ResponseBody
	@GetMapping("/selectReviewsList/{memberNo}")
	public String memberReview(@PathVariable("memberNo") int memberNo) {
		List<Review> reviewList = service.selectMemberReview(memberNo);
		return new Gson().toJson(reviewList);
	}
	
	// 내 구매/판매 조회
	@GetMapping("/myMall")
	public String myMall() {
		
		return "member/myPage/myPage-purchases";
	}
	
	// 내 상점 소개 변경 ajax
	@ResponseBody
	@GetMapping("/myShop/introChange/intro")
	public int introChange(@ModelAttribute("loginMember") Member loginMember
						 , String report) {
		
		int memberNo = loginMember.getMemberNo();
		
		return service.introChange(memberNo, report);
	}
	
	// 상품관리 판매상태 ajax
	@PostMapping("/main/tradeCondition")
	@ResponseBody
	public int tradeCondition(int boardNo
							, String condition) {
		
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("condition", condition);

		return service.changeTradeCondition(map);
	}
	
	// 끌올 기능 ajax 
	@PostMapping("/itemManage")
	@ResponseBody
	public int itemManage(int boardNo) {
		return service.updateDate(boardNo);
	}
	
	// 구매/판매 내역 조회 ajax
	@GetMapping("/myMall/selectList")
	@ResponseBody
	public String selectList(int memberNo, int type) {	
		return new Gson().toJson(service.selectList(memberNo, type));
	}
}
