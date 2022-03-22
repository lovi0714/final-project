package com.project.pms.myTask.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.myTask.service.MyApprovalService;

@Controller
@RequestMapping("/myTask/*")
public class MyApprovalController {

	@Autowired
	private MyApprovalService service;
	
	// 내 결재 조회
	@GetMapping("/approvalList.do")
	public String getApprovalList(Model d) {
		System.out.println("getApprovalList controller called...");
		int empId = 1;
		d.addAttribute("WaitingList", service.getMyApprovalWaitingList(empId));
		d.addAttribute("CompletedList", service.getMyApprovalCompletedList(empId));
		d.addAttribute("RejectedList", service.getMyApprovalRejectedList(empId));		
		
		return "myTask/approvalList";
	}
}
