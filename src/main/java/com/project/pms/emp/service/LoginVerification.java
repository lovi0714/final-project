package com.project.pms.emp.service;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.pms.emp.vo.Emp;

@Service
public class LoginVerification {
	
	// @Autowired
	// PasswordManagement passwordManagement;
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	/* 로그인 검증 */
	public boolean loginVerification(Emp emp) { // String rawPassword
		if (emp != null) { // && passwordEncoder.matches(rawPassword, emp.getPassword())
			return true;
		}
			return false;
	}
}
