package com.project.pms.emp.controller;


import java.net.PasswordAuthentication;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.classmate.util.ResolvedTypeCache.Key;
import com.lowagie.text.List;
import com.project.pms.emp.repository.EmpDAO;
import com.project.pms.emp.service.EmailManagement;
import com.project.pms.emp.service.EmpService;
import com.project.pms.emp.service.LoginVerification;
import com.project.pms.emp.vo.Email;
import com.project.pms.emp.vo.Emp;
import com.project.pms.emp.vo.EmpProfile;


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
	@ResponseBody
	@PostMapping("/loginProcess.do")
	public ResponseEntity<String> loginProcess(Emp emp, HttpServletRequest req) {
		String rawPassword = emp.getPassword();
		
		emp = empService.loginInfo(emp.getEmpId());
		if(loginVerification.loginVerification(emp, rawPassword)) {
			HttpSession session = req.getSession();
			session.setAttribute("emp", emp);					
			session.setMaxInactiveInterval(60 * 30);			
			return ResponseEntity.ok().body("success");
		}
		return ResponseEntity.status(HttpStatus.NOT_FOUND).body("failed");
	}
	
	/* 로그아웃 처리 */
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/emp/login.do";
	}
	
	/* 사원추가 화면 */
	@GetMapping("/addEmp.do")
	public String addEmp() {
		return "emp/addEmp";
	}
	
	/* 사원정보 저장처리 */
	@PostMapping("/addEmp.do")
	public String joinEmp(Emp emp, Email vo) {
		UUID uid = UUID.randomUUID();  
		String randomPassword = uid.toString().substring(0,6);
		emp.setPassword(randomPassword);
		
		empService.joinEmp(emp, vo);
		emailManagement.sendMail(emp, vo);	
		
		return "redirect:/emp/addEmp.do";  
					
	}
	
	/* 프로필 화면 */
	@GetMapping("/profile.do")
	public String empInfo(HttpSession session, Model m) {
		int empId = ((Emp) session.getAttribute("emp")).getEmpId();
		m.addAttribute("emp", empService.empInfo(empId));
		return "emp/profile";		
	}
	
	/* 프로필 수정 화면 */
	@GetMapping("/profileModify.do")
	public String profileModify(HttpSession session, Model m) {
		int empId = ((Emp) session.getAttribute("emp")).getEmpId();
		m.addAttribute("emp", empService.empInfo(empId));
		return "emp/profileModify";
	}
	
	/* 프로필 수정 처리 */
	@PostMapping("/profileModify.do")
	public String profileModify(HttpSession session, Emp emp) {
		int empId = ((Emp) session.getAttribute("emp")).getEmpId();
		
		emp.setEmpId(empId);
		empService.modifyProfile(emp);
		return "redirect:/emp/profile.do";
		
	}
	
	
	/* 비밀번호 변경 화면 */
	@GetMapping("/modifyPassword.do")
	public String modifyPassword() {
		return "emp/modifyPassword";
	}
	
	/* 비밀번호 변경 처리 */
	@PostMapping("/modifyPassword.do")
	public String modifyPassword(HttpSession session, Emp emp) {
		String rawPassword = emp.getPassword();
		int empId = ((Emp) session.getAttribute("emp")).getEmpId();
		
		emp.setEmpId(empId);
		empService.modifyPassword(emp, rawPassword);
		return "redirect:/emp/modifyPassword.do";
		
	}
	
	/* 사용자 현황 */
	@GetMapping("/empStatus.do")
	public String status(Model m) {
		m.addAttribute("empStatus", empService.getEmpStatus());
		return "emp/status";
	}
	
	/* 사용자 정보 화면 */
	@GetMapping("/getEmpInfoList.do")
	public String getEmpInfoList(Model m) {
		m.addAttribute("empInfoList", empService.getEmpInfoList());
		return "/admin/empInfoList";
	}
}
