package com.project.pms.emp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.pms.emp.vo.Emp;

@Service
public class LoginVerification {
	
	@Autowired
	EmpService empService;
	// PasswordManagement passwordManagement;
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	/* 로그인 검증 */
	public boolean loginVerification(Emp emp, String rawPassword) {
		String encryptPassword = emp.getPassword();

		if (emp.getUpdateAt() == null && rawPassword.equals(emp.getPassword())) {
			return true;
		} else if (emp.getUpdateAt() != null && passwordEncoder.matches(rawPassword, encryptPassword)) { 
			return true;
		} else {
			return false;
		}	
		
	}
}
