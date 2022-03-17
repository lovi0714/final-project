package com.project.pms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	/* 로그인 화면 */
	@GetMapping("/login.do")
	public String login() {
		return "user/login";
	}
	
	/* 프로필 화면 */
	@GetMapping("/profile.do")
	public String profile() {
		return "user/profile";
	}
}
