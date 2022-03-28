package com.project.pms.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.pms.emp.service.EmailManagement;
import com.project.pms.emp.vo.Email;

@Controller
@RequestMapping("/emp/*")
public class EmailController {
	
	@Autowired
	EmailManagement emailManagement; // 서비스를 호출하기 위한 의존성 주입
	
	@GetMapping("/signUp.do")
	public String signUp() {
		return "/emp/signUp";
	}
	
	@PostMapping("/sendEmail.do") 
	public String send(@ModelAttribute Email vo, Model m) {
		try {
			emailManagement.sendMail(vo); // vo(메일 관련 정보)를 sendMail 저장
			m.addAttribute("msg", "이메일 발송 성공");
		} catch (Exception e) {
			e.printStackTrace();
            m.addAttribute("msg", "이메일 발송 실패");
		}
		return "redirect:/emp/addEmp"; // 이메일 전송 실패 시 다시 회원가입 페이지 이동.
	} 
	
	
}
