package com.project.pms.myTask.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.myTask.service.MyTaskService;

@Controller
@RequestMapping("/myTask/*")
public class MyTaskController {

	@Autowired
	private MyTaskService service;
	
	// 작업 목록
	@GetMapping("/list.do")
	public String getMyTaskList(Model d) {
		System.out.println("getMyTaskList Controller called...");
		int empId = 3;
		d.addAttribute("MyTaskList", service.getMyTaskList(empId));
		
		return "myTask/list";
	}
	
	// 작업정보 조회
	@GetMapping("/Detail.do")
	public String getMyTaskDetail(Model d, @RequestParam("taskId") int taskId) {
		System.out.println("getMyTaskDetail controller called...");
		d.addAttribute("MyTaskDetail", service.getMyTaskDetail(taskId));
		
		return "myTask/list";
	}
}