package com.project.pms.myTask.controller;

import java.util.Arrays;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	public String getMyTaskList(HttpSession session, Model d) {
		System.out.println("getMyTaskList Controller called...");
		int empId = (int)session.getAttribute("empId");
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
	@PostMapping("/uptDetail.do")
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
	@PostMapping(value="/approvalRequest.do", consumes = "application/json")
	@ResponseBody
	public String uptApprovalRequest(@RequestBody Map<String, Object> map, MyTask myTask, String result) {
		System.out.println("uptApprovalRequest controller called...");
		
		String tid = map.get("taskId").toString();
		String pid = map.get("pmId").toString(); 
		String reqContent = map.get("reqContent").toString();
		
		int[] taskId = Arrays.stream(tid.substring(1, tid.length() - 1).split(",")).map(String::trim).mapToInt(Integer::parseInt).toArray();
		int[] pmId = Arrays.stream(pid.substring(1, pid.length() - 1).split(",")).map(String::trim).mapToInt(Integer::parseInt).toArray();
		myTask.setReqContent(reqContent);
		
		for (int i=0; i<taskId.length; i++) {
			myTask.setTaskId(taskId[i]);
			myTask.setPmId(pmId[i]);
			
			if(service.uptApprovalRequest(taskId[i]) && service.insertApproval(myTask)) {
				result = "success";	
			} else {
				result = "false";
			}	
		}
		
		return result;	
	}
}