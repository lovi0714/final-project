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
	
	// 종합 대시보드
	@GetMapping("/general.do")
	public String getDashboardGeneral(Model d) {
		System.out.println("getDashboardGeneral controller called...");
		d.addAttribute("NoticeList", service.getNoticeList());
		d.addAttribute("ProjectList", service.getProjectList());
		
		return "dashboard/general";
	}
	
	
	// 개인 대시보드
	@GetMapping("/personal.do")
	public String getDashboardPersonal(Model d) {
		System.out.println("getDashboardPersonal controller called...");
		int empId = 1;
		d.addAttribute("MyProjectList", service.getMyProjectList(empId));
		
		return "dashboard/personal";
	}
}
