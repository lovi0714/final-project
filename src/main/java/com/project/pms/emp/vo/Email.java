package com.project.pms.emp.vo;

public class Email {
	private String senderName;    // 발신자 이름
	private String senderMail;    // 발신자 이메일 주소
	private String empEmail;  	  // 수신자(직원) 이메일 주소
	private String subject;       // 제목
	private String content;       // 본문
	private String password;
	private int empId;

	
	public Email() {
		
	}


	public Email(String senderName, String senderMail, String empEmail, String subject, String content, String password,
			int empId) {
		super();
		this.senderName = senderName;
		this.senderMail = senderMail;
		this.empEmail = empEmail;
		this.subject = subject;
		this.content = content;
		this.password = password;
		this.empId = empId;
	}


	public String getSenderName() {
		return senderName;
	}


	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}


	public String getSenderMail() {
		return senderMail;
	}


	public void setSenderMail(String senderMail) {
		this.senderMail = senderMail;
	}


	public String getEmpEmail() {
		return empEmail;
	}


	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public int getEmpId() {
		return empId;
	}


	public void setEmpId(int empId) {
		this.empId = empId;
	}


	@Override
	public String toString() {
		return "Email [senderName=" + senderName + ", senderMail=" + senderMail + ", empEmail=" + empEmail
				+ ", subject=" + subject + ", content=" + content + ", password=" + password + ", empId=" + empId
				+ ", getSenderName()=" + getSenderName() + ", getSenderMail()=" + getSenderMail() + ", getEmpEmail()="
				+ getEmpEmail() + ", getSubject()=" + getSubject() + ", getContent()=" + getContent()
				+ ", getPassword()=" + getPassword() + ", getEmpId()=" + getEmpId() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
}
