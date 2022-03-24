package com.project.pms.dashboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.dashboard.service.DashboardService;

@Controller
@RequestMapping("/dashboard/*")
public class DashboardController {

	@Autowired
	private DashboardService service;
	
	// *** 종합 대시보드 ***
	@GetMapping("/general.do")
	public String getDashboardGeneral(Model d) {
		System.out.println("getDashboardGeneral controller called...");
		
		d.addAttribute("NoticeList", service.getNoticeList());
		d.addAttribute("ProjectList", service.getProjectList());
		d.addAttribute("RiskStatusChart1", service.getRiskStatusChart1());
		d.addAttribute("RiskStatusChart2", service.getRiskStatusChart2());
		
		return "dashboard/general";
	}
	
	// *** 개인 대시보드 ***
	@GetMapping("/personal.do")
	public String getDashboardPersonal(Model d) {
		System.out.println("getDashboardPersonal controller called...");
		int empId = 3; // 세션 처리 예정
		
		d.addAttribute("MyProjectList", service.getMyProjectList(empId));
		d.addAttribute("MyTaskStatusChart", service.getMyTaskStatusChart(empId));
		d.addAttribute("MyRiskStatusChart1", service.getMyRiskStatusChart1(empId));
		d.addAttribute("MyRiskStatusChart2", service.getMyRiskStatusChart2(empId));
		
		return "dashboard/personal";
	}
}
