package com.project.pms.approval.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pms.approval.service.ApprovalService;
import com.project.pms.emp.vo.Emp;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Autowired
	private ApprovalService service;
	
	@GetMapping("/list.do")
	public String getList(HttpSession session, Model model) {
		
		Integer approverId = ((Emp)session.getAttribute("emp")).getEmpId();
		model.addAttribute("list", service.getApprovalList(approverId));
		
		System.out.println(service.getApprovalList(approverId));
		
		return "approval/list";
	}
	
	@ResponseBody
	@PostMapping("/approval/{approvalId}")
	public ResponseEntity<String> setApproval(@PathVariable Integer approvalId) {
		
		int result = service.setApproval(approvalId);
		System.out.println("승인결과" + result);
		return (result == 1) ? ResponseEntity.ok().body("success") : ResponseEntity.badRequest().body("fail"); 
	}
	
	@ResponseBody
	@PostMapping("/reject/{approvalId}")
	public ResponseEntity<String> setReject(@PathVariable Integer approvalId) {
		
		int result = service.setReject(approvalId);
		
		return (result == 1) ? ResponseEntity.ok().body("success") : ResponseEntity.badRequest().body("fail"); 
	}
}
