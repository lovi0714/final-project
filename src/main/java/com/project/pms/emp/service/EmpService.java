package com.project.pms.emp.service;

import java.util.Random;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.pms.emp.repository.EmpDAO;
import com.project.pms.emp.vo.Email;
import com.project.pms.emp.vo.Emp;

@Service
public class EmpService {
	
	@Autowired
	private EmpDAO empDAO;
	
	
	
	// @Autowired
	// PasswordManagement passwordManagement;
	
	// 사원추가
	public boolean joinEmp(Emp emp, Email vo) { 
		UUID uid = UUID.randomUUID();  
		String randomPassword = uid.toString().substring(0,6);
		emp.setPassword(randomPassword);
		empDAO.saveEmp(emp);
		return true;
	}	
	
	// 사원정보조회	
	public Emp empInfo(int empId) {
		return empDAO.empInfo(empId);
	}
	
	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	/* 비밀번호 변경 */
	public void modifyPassword(Emp emp) {
		empDAO.modifyPassword(emp);
	}
}
