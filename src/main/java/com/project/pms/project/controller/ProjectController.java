package com.project.pms.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@GetMapping("/list.do")
	public String getList() {
		
		return "project/list";
	}
	
	@GetMapping("/create.do")
	public String getCreate() {
		
		return "project/create";
	}
	
	@GetMapping("/fileList.do")
	public String getFileList() {
		
		return "project/fileList";
	}
	
	@GetMapping("/approvalList.do")
	public String getApprovalList() {
		
		return "project/approvalList";
	}
	
}
