package com.project.pms.emp.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.pms.emp.vo.Emp;

@Service
public class PasswordManagement {
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	public String encryptPassword(Emp emp) {
		String rawPassword = emp.getPassword();
		return passwordEncoder.encode(rawPassword);
	}
}
