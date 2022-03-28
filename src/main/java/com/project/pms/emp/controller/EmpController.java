package com.project.pms.emp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.emp.service.EmpService;
import com.project.pms.emp.service.LoginVerification;
import com.project.pms.emp.vo.Emp;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	@Autowired
	EmpService empService;
	@Autowired
	LoginVerification loginVerification;
	
	/* 로그인 화면 */
	@GetMapping("/login.do")
	public String login() {
		return "emp/login";
	}
	
	/* 로그인 처리 */
	@PostMapping("/loginProcess.do")
	public String loginProcess(Emp emp, HttpSession session) {
		// String rawPassword = emp.getPassword();
		if(loginVerification.loginVerification(emp)) { // , rawPassword
			session.setAttribute("emp", emp);
			session.setAttribute("empId", emp.getEmpId());
			session.setAttribute("name", emp.getName());
			
			session.setMaxInactiveInterval(60 * 30);
			return "redirect:/dashboard/general.do";
		}
		return "redirect:/emp/login.do";
	}
	
	/* 로그아웃 처리 */
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/emp/login.do";
	}
	
	/* 사원추가 페이지 */
	@GetMapping("/addEmp.do")
	public String addEmp() {
		return "emp/addEmp";
	}
	
	/* 사원 정보 저장 */
	@PostMapping("/addEmp.do")
	public String joinEmp(Emp emp) {
		// String rawPassword = emp.getPassword();
		empService.joinEmp(emp); //, rawPassword
		return "redirect:/emp/login.do";
	}
	
	/* 프로필 화면 */
	@GetMapping("/profile.do")
	public String profile() {
		return "emp/profile";
	}
	
	/* 프로필 수정 */
	@PostMapping("/profileModify.do")
	public String profileModify() {
		return "emp/profileModify";
	}
	
	/* 사용자 현황 */
	@GetMapping("/status.do")
	public String status() {
		return "emp/status";
	}
}
