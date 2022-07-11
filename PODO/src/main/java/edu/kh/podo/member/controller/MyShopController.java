package edu.kh.podo.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.podo.board.itemBoard.model.vo.ItemBoard;
import edu.kh.podo.member.model.service.MyShopService;
import edu.kh.podo.member.model.vo.Review;

@Controller
@RequestMapping("/member/myShop")
@SessionAttributes({"loginMember"})
public class MyShopController {
	
	@Autowired
	private MyShopService service;
	
	// 내 판매상품 조회
	@ResponseBody
	@GetMapping("/myShopMain")
	public String myShopMain(int memberNo) {
		List<ItemBoard> mySellList = service.selectMyShop(memberNo);
		return new Gson().toJson(mySellList);
	}
	
	// 내 후기 조회
	@ResponseBody
	@GetMapping("/myReview")
	public String myReview(int memberNo) {
		List<Review> reviewList = service.selectReview(memberNo);
		return new Gson().toJson(reviewList);
	}
	
}
