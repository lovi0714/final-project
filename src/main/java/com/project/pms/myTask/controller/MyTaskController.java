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

import com.project.pms.emp.vo.Emp;
import com.project.pms.myTask.service.MyOutputService;
import com.project.pms.myTask.service.MyTaskService;
import com.project.pms.myTask.vo.MyTask;
import com.project.pms.output.service.OutputService;

@Controller
@RequestMapping("/myTask/*")
public class MyTaskController {

	@Autowired
	private MyTaskService taskService;
	
	@Autowired
	private MyOutputService myOutputService;
	
	@Autowired
	private OutputService outputService;
	
	// 내 작업 목록
	@GetMapping("/list.do")
	public String getMyTaskList(HttpSession session, Model model) {
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		
		// 작업
		model.addAttribute("taskProject", taskService.getProjectList(empId));
		model.addAttribute("status", taskService.getStatusList());
		model.addAttribute("taskList", taskService.getMyTaskList(empId));
		
		// 산출물
		model.addAttribute("outputProject", myOutputService.getProjectList(empId));
		model.addAttribute("outputList", myOutputService.getMyOutputList(empId));
		model.addAttribute("project", myOutputService.getOutputProject(empId));
		model.addAttribute("category", outputService.getOutputCategory());
		model.addAttribute("type", outputService.getOutputType());
		
		return "myTask/list";
	}
	
	// 작업정보 조회
	@GetMapping("/detail.do")
	public String getMyTaskDetail(@RequestParam("taskId") int taskId, MyTask myTask, HttpSession session, Model model) {
		myTask.setEmpId(((Emp)session.getAttribute("emp")).getEmpId());
		myTask.setTaskId(taskId);
		
		model.addAttribute("myTaskDetail", taskService.getMyTaskDetail(taskId));
		model.addAttribute("myOutputInfo", myOutputService.getMyOutputInfo(myTask));
		
		return "pageJsonReport";
	}
	
	// 작업정보 수정
	@PostMapping("/uptDetail.do")
	@ResponseBody
	public String uptMyTaskDetail(MyTask myTask) {
		boolean result = taskService.uptMyTaskDetail(myTask);
		
		return result ? "success" : "false";
	}
	
	// 승인요청
	@PostMapping(value="/approvalRequest.do", consumes = "application/json")
	@ResponseBody
	public String uptApprovalRequest(@RequestBody Map<String, Object> map, MyTask myTask, boolean result) {
		
		String tid = map.get("taskId").toString();
		String pid = map.get("pmId").toString(); 
		String reqContent = map.get("reqContent").toString();
		
		int[] taskId = Arrays.stream(tid.substring(1, tid.length() - 1).split(",")).map(String::trim).mapToInt(Integer::parseInt).toArray();
		int[] pmId = Arrays.stream(pid.substring(1, pid.length() - 1).split(",")).map(String::trim).mapToInt(Integer::parseInt).toArray();
		myTask.setReqContent(reqContent);
		
		for (int i=0; i<taskId.length; i++) {
			myTask.setTaskId(taskId[i]);
			myTask.setPmId(pmId[i]);	
			result = taskService.uptApprovalRequest(taskId[i]) && taskService.insertApproval(myTask);
		}
		
		return result ? "success" : "false";	
	}
}