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
import com.project.pms.community.vo.NoticeFile;

@Controller
@RequestMapping("/community/*")
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	// 공지사항 목록
	@GetMapping("/noticeList.do")
	public String getNoticeList(Model model) {
		model.addAttribute("notice", service.getNoticeBoardList());
		
		return "community/noticeList";
	}
	
	// 공지사항 등록
	@GetMapping("/noticeForm.do")
	public String getNoticeForm() {
		return "community/noticeForm";
	}
	
	@PostMapping("/noticeInsert.do")
	public String insertNotice(Notice notice, Model model) {
		model.addAttribute("result", service.insertNotice(notice));
		
		return "community/noticeForm";
	}
	
	// 공지사항 조회
	@GetMapping("/noticeDetail.do")
	public String getNoticeDetail(@RequestParam("no") int noticeId, Model model) {
		model.addAttribute("noticeDetail", service.getNoticeDetail(noticeId));
		model.addAttribute("noticeFileInfo", service.getNoticeFileInfo(noticeId));
		
		return "community/noticeDetail";
	}
	
	// 첨부파일 다운로드
	@GetMapping("noticeFile.do")
	public String noticeFileDownload(@RequestParam("fileId") int noticeFileId, NoticeFile noticeFile, Model model) {
		
		NoticeFile noticefile = service.getFileInfoByFileId(noticeFileId);
		
		model.addAttribute("storeFileName", noticefile.getOriginalName());
		model.addAttribute("uploadFileName", noticefile.getSaveName());
		
		return "download";
	}
	
	// 공지사항 수정
	@GetMapping("/noticeUpdateForm.do")
	public String updateNoticeForm(@RequestParam("no") int noticeId, Model model) {
		model.addAttribute("noticeDetail", service.getNoticeDetail(noticeId));
		model.addAttribute("noticeFileInfo", service.getNoticeFileInfo(noticeId));
		
		return "community/noticeModify";
	}
	
	@PostMapping("/noticeUpdate.do")
	@ResponseBody
	public String updateNotice(Notice notice) {
		boolean result = service.updateNotice(notice);
		
		return result ? "success" : "false";
	}
	
	// 공지사항 삭제
	@GetMapping("/noticeDelete.do")
	@ResponseBody
	public String deleteNotice(@RequestParam("no") int noticeId) {
		boolean result = service.deleteNotice(noticeId);
		
		return result ? "success" : "false";
	}
}
