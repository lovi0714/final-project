package com.project.pms.emp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.emp.service.EmailManagement;
import com.project.pms.emp.service.EmpService;
import com.project.pms.emp.service.LoginVerification;
import com.project.pms.emp.vo.Email;
import com.project.pms.emp.vo.Emp;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	@Autowired
	EmpService empService;
	@Autowired
	LoginVerification loginVerification;
	@Autowired
	EmailManagement emailManagement;
	
	/* 로그인 화면 */
	@GetMapping("/login.do")
	public String login() {
		return "emp/login";
	}
	
	/* 로그인 처리 */
	@PostMapping("/loginProcess.do")
	public String loginProcess(Emp emp, HttpServletRequest req) {
		// String rawPassword = emp.getPassword();
		emp = empService.empInfo(emp.getEmpId());
		if(loginVerification.loginVerification(emp)) { // , rawPassword
			HttpSession session = req.getSession();
			session.setAttribute("emp", emp);					
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
	
	/* 사원정보 저장 */
	@PostMapping("/addEmp.do")
	public String joinEmp(Emp emp, Email vo) {
		// String rawPassword = emp.getPassword();
		empService.joinEmp(emp); //, rawPassword
		emailManagement.sendMail(vo);
		return "redirect:/emp/addEmp.do";
	}
	
	/* 사원정보 조회 */
	@GetMapping("/empInfo")
	public String empInfo(HttpSession session, Model m) {
		int empId = ((Emp) session.getAttribute("emp")).getEmpId();
		m.addAttribute("emp", empService.empInfo(empId));
		return "emp/modify";		
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
