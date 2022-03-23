package com.project.pms.risk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.risk.service.RiskService;
import com.project.pms.risk.vo.RiskSaveRequest;

@Controller
@RequestMapping("/risk")
public class RiskController {
	
	@Autowired
	private RiskService riskService;

	// 리스크 목록 가져오기
	@GetMapping("/riskBoard.do")
	public String getRiskList(Model model) {
		model.addAttribute("riskList", riskService.getRiskList());

		return "risk/riskBoard";
	}

	// 상세 페이지 가져오기
	@GetMapping("/detail.do")
	public String getDetail(@RequestParam int riskId, Model model) {
		
		model.addAttribute("detail", riskService.getRiskDetail(riskId));
		return "risk/detail";
	}
	
	// 리스크 등록 페이지 
	@GetMapping("/write.do")
	public String writeRisk(Model model) {
		
		model.addAttribute("emp", riskService.getEmpList());
		model.addAttribute("prj", riskService.getProjectList());
		model.addAttribute("task",riskService.getMyTaskList());
		return "risk/writeForm";
	}
	
	// 수정 페이지 가져오기
	@GetMapping("/modify.do")
	public String modifyRisk(@RequestParam int riskId, Model model) {
		model.addAttribute("emp", riskService.getEmpList());
		model.addAttribute("prj", riskService.getProjectList());
		model.addAttribute("task",riskService.getMyTaskList());
		model.addAttribute("risk", riskService.getRiskDetail(riskId));
		return "risk/modify";
	}
	
	// 글 저장하기
	@PostMapping("/create.do")
	public String createRisk(RiskSaveRequest riskSaveRequest) throws Exception {
		
		riskService.createRisk(riskSaveRequest);
		return "redirect:/risk/riskBoard.do";
	}
	
	// 글 삭제하기
	@GetMapping("/delete.do")
	public String deleteRisk(@RequestParam int riskId) {
		riskService.deleteRisk(riskId);
		return "redirect:/risk/riskBoard.do";
	}
}
