package com.project.pms.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.pms.admin.service.AdminService;
import com.project.pms.emp.service.EmailManagement;
import com.project.pms.emp.service.EmpService;
import com.project.pms.emp.vo.Emp;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Autowired
	EmpService empService;
	@Autowired
	AdminService adminService;
	
	/* 사원 상세 화면 */
	@GetMapping("/EmpInfoDetails.do")
	public String EmpInfoDetails(Model m, @RequestParam int empId) {
		m.addAttribute("emp", empService.empInfo(empId));
		return "admin/EmpInfoDetails";		
	}

	
}
