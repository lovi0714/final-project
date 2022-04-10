package com.project.pms.dashboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.dashboard.service.DashboardService;
import com.project.pms.emp.vo.Emp;

@Controller
@RequestMapping("/dashboard/*")
public class DashboardController {

	@Autowired
	private DashboardService service;
	
	// *** 종합 대시보드 ***
	@GetMapping("/general.do")
	public String getDashboardGeneral(Model model) {
		
		// 공지사항
		model.addAttribute("notice", service.getNoticeList());
		
		// 프로젝트 현황
		model.addAttribute("project", service.getProjectList());
		
		// 부서별 프로젝트 현황
		model.addAttribute("projectChart1", service.getProjectChart1());
		model.addAttribute("projectChart2", service.getProjectChart2());
		model.addAttribute("projectChart3", service.getProjectChart3());
		model.addAttribute("projectChart4", service.getProjectChart4());
		model.addAttribute("projectChart5", service.getProjectChart5());
		
		// 리스크 현황
		model.addAttribute("riskStatusChart1", service.getRiskStatusChart1()); // 상태별
		model.addAttribute("riskStatusChart2", service.getRiskStatusChart2()); // 유형별	
		
		return "dashboard/general";
	}
	
	// *** 개인 대시보드 ***
	@GetMapping("/personal.do")
	public String getDashboardPersonal(HttpSession session, Model model) {
		
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		
		// 참여 프로젝트
		model.addAttribute("myProject", service.getMyProjectList(empId));
		
		// 작업 진행상태
		model.addAttribute("myTaskStatusChart", service.getMyTaskStatusChart(empId));
		
		// 리스크 현황
		model.addAttribute("myRiskStatusChart1", service.getMyRiskStatusChart1(empId));
		model.addAttribute("myRiskStatusChart2", service.getMyRiskStatusChart2(empId));
		
		return "dashboard/personal";
	}
	
}


