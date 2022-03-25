package com.project.pms.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
//	@Autowired
//	private AdminService adminService;
	
	/* 직원정보 조회 */
	@GetMapping("/userInfo.do") 
	public String userInfo() {
		return "admin/userInfo";
	}
	
}
