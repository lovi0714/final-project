package com.project.pms.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	/* 로그인 화면 */
	@GetMapping("/login.do")
	public String login() {
		return "emp/login";
	}
	
	/* 프로필 화면 */
	@GetMapping("/profile.do")
	public String profile() {
		return "emp/profile";
	}
	
	/* 프로필 수정 */
	@PostMapping("/profileModify.do")
	public String profileModify() {
		return "emp/profileModify";
	}
	
	/* 사용자 현황 */
	@GetMapping("/status.do")
	public String status() {
		return "emp/status";
	}
}
