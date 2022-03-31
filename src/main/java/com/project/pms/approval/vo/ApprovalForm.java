package com.project.pms.approval.vo;

import java.time.LocalDateTime;

public class ApprovalForm {
	private Integer approvalId;
	private String taskName;
	private String projectName;
	private String empName;
	private Integer statusId;
	private LocalDateTime approvalDate;
	
	public ApprovalForm() {
		super();
	}

	public ApprovalForm(Integer approvalId, String taskName, String projectName, String empName, Integer statusId,
			LocalDateTime approvalDate) {
		super();
		this.approvalId = approvalId;
		this.taskName = taskName;
		this.projectName = projectName;
		this.empName = empName;
		this.statusId = statusId;
		this.approvalDate = approvalDate;
	}

	public Integer getApprovalId() {
		return approvalId;
	}

	public void setApprovalId(Integer approvalId) {
		this.approvalId = approvalId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getStatusId() {
		return statusId;
	}

	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}

	public LocalDateTime getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(LocalDateTime approvalDate) {
		this.approvalDate = approvalDate;
	}

	@Override
	public String toString() {
		return "ApprovalForm [approvalId=" + approvalId + ", taskName=" + taskName + ", projectName=" + projectName
				+ ", empName=" + empName + ", statusId=" + statusId + ", approvalDate=" + approvalDate + "]";
	}
	
}
