package com.project.pms.emp.vo;

public class Email {
	private String senderName;    // 발신자 이름
	private String senderMail;    // 발신자 이메일 주소
	private String empEmail;  	  // 수신자(직원) 이메일 주소
	private String subject;       // 제목
	private String content;       // 본문
	private int deptId;			  // 부서 번호
	private int authId;			  // 권한 번호
	private int posId;			  // 직급 번호
	
	public Email() {
		
	}

	public Email(String senderName, String senderMail, String empEmail, String subject, String content, int deptId,
			int authId, int posId) {
		super();
		this.senderName = senderName;
		this.senderMail = senderMail;
		this.empEmail = empEmail;
		this.subject = subject;
		this.content = content;
		this.deptId = deptId;
		this.authId = authId;
		this.posId = posId;
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

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	public int getPosId() {
		return posId;
	}

	public void setPosId(int posId) {
		this.posId = posId;
	}

	@Override
	public String toString() {
		return "Email [senderName=" + senderName + ", senderMail=" + senderMail + ", empEmail=" + empEmail
				+ ", subject=" + subject + ", content=" + content + ", deptId=" + deptId + ", authId=" + authId
				+ ", posId=" + posId + "]";
	}

	


	 
}
