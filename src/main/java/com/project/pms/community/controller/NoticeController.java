package com.project.pms.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pms.community.service.NoticeService;
import com.project.pms.community.vo.Notice;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	// 공지사항 목록
	@GetMapping("/noticeList.do")
	public String getNoticeList(Model d) {
		System.out.println("getNoticeList Controller called...");
		d.addAttribute("NoticeList", service.getNoticeBoardList());
		
		return "community/noticeList";
	}
	
	// 공지사항 등록
	@GetMapping("/noticeForm.do")
	public String getNoticeForm() {
		System.out.println("insertNoticeForm Controller called...");
		
		return "community/noticeForm";
	}
	
	@PostMapping("/noticeInsert.do")
	@ResponseBody
	public String insertNotice(Notice notice, String result) {
		System.out.println("insertNotice Controller called...");
		
		if (service.insertNotice(notice)) {
			result = "success";
		} else {
			result = "false";
		}
		
		return result;
	}
	
	// 공지사항 조회
	@GetMapping("/noticeDetail.do")
	public String getNoticeDetail(Model d, @RequestParam("noticeId") int noticeId) {
		System.out.println("getNoticeDetail Controller called...");
		d.addAttribute("NoticeDetailList", service.getNoticeDetail(noticeId));
		
		return "community/noticeDetail";
	}
	
	// 공지사항 수정
	@GetMapping("/noticeUpdateForm.do")
	public String updateNoticeForm(Model d, @RequestParam("noticeId") int noticeId) {
		System.out.println("updateNotice Controller called...");
		d.addAttribute("NoticeDetailList", service.getNoticeDetail(noticeId));
	
		return "community/noticeModify";
	}
	
	@PostMapping("/noticeUpdate.do")
	@ResponseBody
	public String updateNotice(Model d, Notice notice, String result) {
		System.out.println("updateNotice Controller called...");
		
		if(service.updateNotice(notice)) {
			result = "success";
		} else {
			result = "false";
		}
		
		return result;
	}
	
	// 공지사항 삭제
	@GetMapping("/noticeDelete.do")
	@ResponseBody
	public String deleteNotice(@RequestParam("noticeId") int noticeId, String result) {
		System.out.println("deleteNotice Controller called...");
		
		if(service.deleteNotice(noticeId)) {
			result = "success";
		} else {
			result = "false";
		}
	
		return result;
	}
}
