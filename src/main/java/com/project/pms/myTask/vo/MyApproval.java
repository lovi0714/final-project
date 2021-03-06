package com.project.pms.myTask.vo;

import java.util.Date;

public class MyApproval {
	private int taskId;
	private String taskName;
	private String prjId;
	private String prjName;
	private String approver;
	private String apStatus;
	private Date createAt;
	private Date approvalAt;
	private Date rejectAt;
	
	public MyApproval() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyApproval(int taskId, String taskName, String prjId, String prjName, String approver, String apStatus,
			Date createAt, Date approvalAt, Date rejectAt) {
		super();
		this.taskId = taskId;
		this.taskName = taskName;
		this.prjId = prjId;
		this.prjName = prjName;
		this.approver = approver;
		this.apStatus = apStatus;
		this.createAt = createAt;
		this.approvalAt = approvalAt;
		this.rejectAt = rejectAt;
	}

	public int getTaskId() {
		return taskId;
	}

	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getPrjId() {
		return prjId;
	}

	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}

	public String getPrjName() {
		return prjName;
	}

	public void setPrjName(String prjName) {
		this.prjName = prjName;
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
