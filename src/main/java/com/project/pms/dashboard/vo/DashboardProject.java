package com.project.pms.dashboard.vo;

import java.util.Date;

public class DashboardProject {
	private String projectId;
	private String title;
	private int pmDeptId;
	private String pmDeptName;
	private String pmName;
	private int statusId;
	private String status;
	private Date startAt;
	private Date endAt;
	
	public DashboardProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashboardProject(String projectId, String title, int pmDeptId, String pmDeptName, String pmName,
			int statusId, String status, Date startAt, Date endAt) {
		super();
		this.projectId = projectId;
		this.title = title;
		this.pmDeptId = pmDeptId;
		this.pmDeptName = pmDeptName;
		this.pmName = pmName;
		this.statusId = statusId;
		this.status = status;
		this.startAt = startAt;
		this.endAt = endAt;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPmDeptId() {
		return pmDeptId;
	}

	public void setPmDeptId(int pmDeptId) {
		this.pmDeptId = pmDeptId;
	}

	public String getPmDeptName() {
		return pmDeptName;
	}

	public void setPmDeptName(String pmDeptName) {
		this.pmDeptName = pmDeptName;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getStartAt() {
		return startAt;
	}

	public void setStartAt(Date startAt) {
		this.startAt = startAt;
	}

	public Date getEndAt() {
		return endAt;
	}

	public void setEndAt(Date endAt) {
		this.endAt = endAt;
	}
	
	
		
}
