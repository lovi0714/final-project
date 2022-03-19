package com.project.pms.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class ChatController {
	
	@GetMapping("/chat.do")
	public String startChat() {
		
		return "community/chat";
	}

}
