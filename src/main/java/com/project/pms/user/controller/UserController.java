package com.project.pms.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	/* 프로필 수정 */
	@PostMapping("/profileModify.do")
	public String profileModify() {
		return "user/profileModify";
	}
	
	/* 사용자 현황 */
	@GetMapping("/status.do")
	public String status() {
		return "user/status";
	}
}
