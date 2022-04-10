package com.project.pms.admin.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.pms.admin.repository.AdminDAO;
import com.project.pms.emp.repository.EmpDAO;
import com.project.pms.emp.vo.Emp;



@Service
public class AdminService {
	@Autowired
	EmpDAO empDAO;
	
	@Autowired
	AdminDAO adminDAO;
	
	/* 사원 상세정보 조회 */	
	public Emp empInfo(int empId) {
		return empDAO.empInfo(empId);
	}
	
	
	
}
