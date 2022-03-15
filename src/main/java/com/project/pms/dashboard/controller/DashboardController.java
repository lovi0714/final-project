package com.project.pms.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dashboard/*")
public class DashboardController {

	// 종합 대시보드
	@GetMapping("/general.do")
	public String getDashboardGeneral() {
		System.out.println("getDashboardGeneral getController called...");
		
		return "dashboard/general";
	}
	
	// 개인 대시보드 
	@GetMapping("/personal.do")
	public String getDashboardPersonal() {
		System.out.println("getDashboardPersonal getController called...");
		
		return "dashboard/personal";
	}
	
	
}
