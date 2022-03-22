package com.project.pms.myTask.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myTask/*")
public class MyApprovalController {

	// 내 결재
	@GetMapping("/approvalList.do")
	public String getApprovalList() {
		System.out.println("getApprovalList getController called...");
		
		return "myTask/approvalList";
	}
}
