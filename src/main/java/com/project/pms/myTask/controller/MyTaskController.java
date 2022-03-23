package com.project.pms.myTask.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.myTask.service.MyTaskService;

@Controller
@RequestMapping("/myTask/*")
public class MyTaskController {

	@Autowired
	private MyTaskService service;
	
	// 내 작업 조회
	@GetMapping("/list.do")
	public String getMyTaskList(Model d) {
		System.out.println("getMyTaskList Controller called...");
		int empId = 3;
		d.addAttribute("MyTaskList", service.getMyTaskList(empId));
		
		return "myTask/list";
	}
	
}