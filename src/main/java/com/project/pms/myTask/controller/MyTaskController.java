package com.project.pms.myTask.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pms.myTask.service.MyTaskService;
import com.project.pms.myTask.vo.MyTask;

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
	@GetMapping("/detail.do")
	public String getMyTaskDetail(Model d, @RequestParam("taskId") int taskId) {
		System.out.println("getMyTaskDetail controller called...");
		d.addAttribute("myTaskDetail", service.getMyTaskDetail(taskId));
		
		return "pageJsonReport";
	}
	
	// 작업정보 수정
	@GetMapping("/uptDetail.do")
	@ResponseBody
	public String uptMyTaskDetail(MyTask myTask, String result) {
		System.out.println("uptMyTaskDetail controller called...");		
		if(service.uptMyTaskDetail(myTask)) {
			result = "success";
		} else {
			result = "false";
		}
	
		return result;
	}
	
	// 승인요청
	@GetMapping("/approvalRequest.do")
	@ResponseBody
	public String uptApprovalRequest(@RequestParam(value="taskId[]") List<Integer> taskId, String result) {
		System.out.println("uptApprovalRequest controller called");
		
		// 작성중
		
		return result;
		
	}
}