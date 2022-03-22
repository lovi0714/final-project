package com.project.pms.myTask.vo;

public class MyApproval {
	private String taskName;
	private String pTitle;
	private String pmName;
	private String apStatus;
	private String createAt;
	private String approvalAt;
	private String rejectAt;
	
	public MyApproval() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyApproval(String taskName, String pTitle, String pmName, String apStatus, String createAt,
			String approvalAt, String rejectAt) {
		super();
		this.taskName = taskName;
		this.pTitle = pTitle;
		this.pmName = pmName;
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

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	public String getApStatus() {
		return apStatus;
	}

	public void setApStatus(String apStatus) {
		this.apStatus = apStatus;
	}

	public String getCreateAt() {
		return createAt;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getApprovalAt() {
		return approvalAt;
	}

	public void setApprovalAt(String approvalAt) {
		this.approvalAt = approvalAt;
	}

	public String getRejectAt() {
		return rejectAt;
	}

	public void setRejectAt(String rejectAt) {
		this.rejectAt = rejectAt;
	}
	
}
