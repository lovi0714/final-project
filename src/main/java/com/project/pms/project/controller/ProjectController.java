package com.project.pms.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.project.service.ProjectService;

@Controller
@RequestMapping("/project/*")
public class ProjectController {
	
	@Autowired
	private ProjectService service;
	
	@GetMapping("/list.do")
	public String getList(Model model) {
		
		model.addAttribute("list", service.getList());
		
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
	
	@PostMapping("/create.do")
	public void createProject() {
		
		
	}
	
}
