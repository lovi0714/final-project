package com.project.pms.emp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.pms.emp.service.EmpService;
import com.project.pms.emp.vo.Emp;

@Controller
@RequestMapping("/emp/*")
public class EmpController {
	
	@Autowired
	EmpService empService;
	
	/* 로그인 화면 */
	@GetMapping("/login.do")
	public String login() {
		return "emp/login";
	}
	
	/* 로그인 처리 */
	@PostMapping("loginCheck.do")
	public String loginCheck(Emp emp, HttpSession session) {
		boolean result = empService.loginCheck(emp, session);
		// ModelAndView mav = new ModelAndView();
		if (emp != null) { // 로그인 성공
			return "redirect:/dashboard/general.do";
			// mav.addObject("msg", "success");
		} else {
			// mav.setViewName("emp/login");
			// mav.addObject("msg", "fail");
			return "redirect:/emp/login.do";
		}
		
	}
	
	/* 로그아웃 처리 */
	@GetMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		empService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emp/login");
		mav.addObject("msg", "logout");
		return mav;
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
