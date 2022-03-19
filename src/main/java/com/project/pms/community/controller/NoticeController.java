package com.project.pms.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	// 공지사항 목록
	@GetMapping("/noticeList.do")
	public String getNoticeList() {
		System.out.println("getNoticeList getController called...");
		
		return "community/noticeList";
	}
	
	// 공지사항 등록
	@GetMapping("/noticeCreate.do")
	public String getNoticeCreate() {
		System.out.println("getNoticeCreate getController called...");
		
		return "community/noticeCreate";
	}
	
	// 공지사항 조회
	@GetMapping("/noticeDetail.do")
	public String getNoticeDetail() {
		System.out.println("getNoticeDetail getController called...");
		
		return "community/noticeDetail";
	}
	
	// 공지사항 수정
	@GetMapping("/noticeUpdate.do")
	public String getNoticeUpdate() {
		System.out.println("getNoticeUpdate getController called...");
		
		return "community/noticeUpdate";
	}
	
	
}
