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
	public String getApprovalList(HttpSession session, Model model) {
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		
		// 승인대기
		model.addAttribute("waitingList", service.getMyApprovalWaitingList(empId));
		model.addAttribute("waitingProject", service.getWaitingProjectList(empId));
	
		// 승인완료
		model.addAttribute("completedList", service.getMyApprovalCompletedList(empId));
		model.addAttribute("completedProject", service.getCompletedProjectList(empId));
		
		// 반려
		model.addAttribute("rejectedList", service.getMyApprovalRejectedList(empId));		
		model.addAttribute("rejectedProject", service.getRejectedProjectList(empId));
		
		return "myTask/approvalList";
	}
	
	// 회수 요청
	@GetMapping("/approvalCancel.do")
	@ResponseBody
	public String uptApprovalCancel(@RequestParam(value="taskId[]") List<Integer> taskId, boolean result) {
		
		for (int i=0; i<taskId.size(); i++) {
			result = service.uptApprovalCancel(taskId.get(i)) && service.uptApprovalStatus(taskId.get(i));
		}
		
		return result ? "success" : "false";	
	}
}
