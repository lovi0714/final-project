package com.project.pms.emp.service;


import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.pms.emp.repository.EmpDAO;
import com.project.pms.emp.vo.Email;
import com.project.pms.emp.vo.Emp;


@Service
public class EmailManagement {
	

	@Autowired
	EmpDAO empDAO;
	
	@Autowired
	JavaMailSender mailSender; // bean, 의존성을 주입
	
	public void sendMail(Emp emp, Email vo) {
		
		try {
			// 이메일 객체
			MimeMessage msg = mailSender.createMimeMessage();
			
			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	        msg.addRecipient(RecipientType.TO, new InternetAddress(vo.getEmpEmail()));
	
	        // 보내는 사람(이메일주소+이름)
	        // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	        // 이메일 발신자
	        msg.addFrom(new InternetAddress[] { new InternetAddress(vo.getSenderMail(), vo.getSenderName()) });
	
	        // 이메일 제목
	        msg.setSubject("CPMS 가입 안내", "utf-8");
	        
	        // 이메일 본문
	        msg.setText("아이디 : 143, 비밀번호:" + emp.getPassword(), "utf-8");
	        
	        // 이메일 보내기
	        mailSender.send(msg);
	        
		} catch (Exception e) {
			e.printStackTrace();	
		}
		
		
	}
}	

	
	
