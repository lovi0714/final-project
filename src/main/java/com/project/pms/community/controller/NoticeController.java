package com.project.pms.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.community.service.NoticeService;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	// 공지사항 목록
	@GetMapping("/noticeList.do")
	public String getNoticeList(Model d) {
		System.out.println("getNoticeList getController called...");
		d.addAttribute("NoticeList", service.getNoticeBoardList());
		
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
	public String getNoticeDetail(Model d, @RequestParam("noticeId") int noticeId) {
		System.out.println("getNoticeDetail getController called...");
		d.addAttribute("NoticeDetailList", service.getNoticeDetail(noticeId));
		
		return "community/noticeDetail";
	}
	
	// 공지사항 수정
	@GetMapping("/noticeUpdate.do")
	public String getNoticeUpdate() {
		System.out.println("getNoticeUpdate getController called...");
		
		return "community/noticeUpdate";
	}
	
	// 공지사항 삭제
}
