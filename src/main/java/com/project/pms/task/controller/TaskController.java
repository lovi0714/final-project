package com.project.pms.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/task/*")
public class TaskController {

	// 내 작업
	@GetMapping("/list.do")
	public String getTaskList() {
		System.out.println("getTaskList getController called...");
		
		return "task/list";
	}
	
	// 내 결재
	@GetMapping("/approvalList.do")
	public String getApprovalList() {
		System.out.println("getApprovalList getController called...");
		
		return "task/approvalList";
	}
	
}
