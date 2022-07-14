package edu.kh.podo.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.service.ItemBoardService;
import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
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

	// 판매자 판매상품 조회
	@GetMapping("/main")
	public String memberShopMain(ItemBoard itemBoard
							   , @ModelAttribute("loginMember") Member loginMember
							   , Model model) {
		
		itemBoard.setMemberNo(loginMember.getMemberNo());
		
		List<ItemBoard> memberSellList = service.selectMemberShop(itemBoard.getMemberNo());
		model.addAttribute("memberSellList", memberSellList);
		
		return "item/itemManage";
	}
	
//	// 판매자 후기 조회
//	@ResponseBody
//	@GetMapping("/memberReview")
//	public String memberReview(int memberNo) {
//		List<Review> reviewList = service.selectMemberReview(memberNo);
//		return new Gson().toJson(reviewList);
//	}
	
	// 내 상점 조회
	@GetMapping("/myShop")
	public String myShop(@ModelAttribute("loginMember") Member loginMember
					   , Model model) {
		
		List<Member> member = service.selectMemberInfo(loginMember.getMemberNo());
		model.addAttribute("member", member);
		
		int boardCount = service.selectBoardCount(loginMember.getMemberNo());
		model.addAttribute("boardCount", boardCount);
		
		return "member/profile";
	}
	
	// 내 상점 물건 조회 ajax
	@ResponseBody
	@GetMapping("selectItemsList")
	public String selectItemsList(int memberNo) {
		
		List<ItemBoard> memberItemList =  service.selectMemberShop(memberNo);

		return new Gson().toJson(memberItemList);
	}
	
	// 내 상점 후기 조회 ajax
	@ResponseBody
	@GetMapping("/selectReviewsList")
	public String memberReview(int memberNo) {
		List<Review> reviewList = service.selectMemberReview(memberNo);
		return new Gson().toJson(reviewList);
	}
}
