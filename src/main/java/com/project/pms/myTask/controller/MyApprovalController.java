package com.project.pms.myTask.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.service.MyApprovalService;

@Controller
@RequestMapping("/myTask/*")
public class MyApprovalController {

	@Autowired
	private MyApprovalService service;
	
	// 내 결재 조회
	@GetMapping("/approvalList.do")
	public String getApprovalList(HttpSession session, Model d) {
		System.out.println("getApprovalList controller called...");
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		d.addAttribute("WaitingList", service.getMyApprovalWaitingList(empId));
		d.addAttribute("CompletedList", service.getMyApprovalCompletedList(empId));
		d.addAttribute("RejectedList", service.getMyApprovalRejectedList(empId));		
		
		return "myTask/approvalList";
	}
	
	// 회수 요청
	@GetMapping("/approvalCancel.do")
	@ResponseBody
	public String uptApprovalCancel(@RequestParam(value="taskId[]") List<Integer> taskId, String result) {
		System.out.println("uptApprovalCancel controller called");
		
		for (int i=0; i<taskId.size(); i++) {
			if(service.uptApprovalCancel(taskId.get(i)) && service.uptApprovalStatus(taskId.get(i))) {
				result = "success";
			} else {
				result ="false";
			}
		}
		
		return result;
		
	}
}
