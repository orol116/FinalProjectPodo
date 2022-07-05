package edu.kh.podo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
			@RequestMapping("/main")
			public String mainForward() {
				
				// index.jsp의 forward을 처리하는 mainForward()에서
				// 다시 한번 comm/main.jsp로 forward
				return "podo/main";
	}
}
