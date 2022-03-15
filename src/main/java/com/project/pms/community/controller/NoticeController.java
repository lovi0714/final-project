package com.project.pms.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	// 공지사항
	@GetMapping("/notice.do")
	public String getNoticeList() {
		System.out.println("getNoticeList getController called...");
		
		return "community/notice";
	}
}
