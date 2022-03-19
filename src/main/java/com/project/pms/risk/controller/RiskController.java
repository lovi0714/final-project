package com.project.pms.risk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.risk.service.RiskService;

@Controller
@RequestMapping("/risk")
public class RiskController {
	
	@Autowired
	private RiskService service;
	
	// 리스크 목록 가져오기
	@GetMapping("/riskBoard.do")
	public String getRiskList(Model model) {
		model.addAttribute("riskList", service.getRiskList());
		return "risk/riskBoard";
	}
	
	// 상세 페이지 가져오기
	@GetMapping("detail.do")
	public String getDetail() {
		return "risk/detail";
	}
	
	// 리스크 등록 페이지 
	@GetMapping("write.do")
	public String writeRisk() {
		return "risk/writeForm";
	}
	
	// 수정 페이지 가져오기
	@GetMapping("modify.do")
	public String modifyRisk() {
		return "risk/modify";
	}
}
