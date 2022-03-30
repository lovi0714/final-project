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
	public String getDashboardGeneral(Model d) {
		System.out.println("getDashboardGeneral controller called...");
		
		// 공지사항
		d.addAttribute("NoticeList", service.getNoticeList());
		
		// 프로젝트 현황
		d.addAttribute("ProjectList", service.getProjectList());
		d.addAttribute("Dept", service.getDeptList());
		d.addAttribute("Status", service.getStatusList());
		
		// 부서별 프로젝트 현황
		d.addAttribute("ProjectChart1", service.getProjectChart1());
		d.addAttribute("ProjectChart2", service.getProjectChart2());
		d.addAttribute("ProjectChart3", service.getProjectChart3());
		d.addAttribute("ProjectChart4", service.getProjectChart4());
		d.addAttribute("ProjectChart5", service.getProjectChart5());
		
		// 리스크 현황
		d.addAttribute("RiskStatusChart1", service.getRiskStatusChart1());
		d.addAttribute("RiskStatusChart2", service.getRiskStatusChart2());
		
		return "dashboard/general";
	}
	
	// *** 개인 대시보드 ***
	@GetMapping("/personal.do")
	public String getDashboardPersonal(HttpSession session, Model d) {
		System.out.println("getDashboardPersonal controller called...");
		int empId = ((Emp)session.getAttribute("emp")).getEmpId();
		
		// 참여 프로젝트
		d.addAttribute("MyProjectList", service.getMyProjectList(empId));
		
		// 작업 진행상태
		d.addAttribute("MyTaskStatusChart", service.getMyTaskStatusChart(empId));
		
		// 리스크 현황
		d.addAttribute("MyRiskStatusChart1", service.getMyRiskStatusChart1(empId));
		d.addAttribute("MyRiskStatusChart2", service.getMyRiskStatusChart2(empId));
		
		return "dashboard/personal";
	}
}


