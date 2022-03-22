package com.project.pms.myTask.vo;

import java.util.Date;

public class MyApproval {
	private String taskName;
	private String pTitle;
	private String approver;
	private String apStatus;
	private Date createAt;
	private Date approvalAt;
	private Date rejectAt;
	
	public MyApproval() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyApproval(String taskName, String pTitle, String approver, String apStatus, Date createAt, Date approvalAt,
			Date rejectAt) {
		super();
		this.taskName = taskName;
		this.pTitle = pTitle;
		this.approver = approver;
		this.apStatus = apStatus;
		this.createAt = createAt;
		this.approvalAt = approvalAt;
		this.rejectAt = rejectAt;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getApprover() {
		return approver;
	}

	public void setApprover(String approver) {
		this.approver = approver;
	}

	public String getApStatus() {
		return apStatus;
	}

	public void setApStatus(String apStatus) {
		this.apStatus = apStatus;
	}

	public Date getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}

	public Date getApprovalAt() {
		return approvalAt;
	}

	public void setApprovalAt(Date approvalAt) {
		this.approvalAt = approvalAt;
	}

	public Date getRejectAt() {
		return rejectAt;
	}

	public void setRejectAt(Date rejectAt) {
		this.rejectAt = rejectAt;
	}
	
	
}
