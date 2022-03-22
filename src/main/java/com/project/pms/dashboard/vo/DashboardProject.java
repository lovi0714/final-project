package com.project.pms.dashboard.vo;

import java.util.Date;

public class DashboardProject {
	private String projectId;
	private String title;
	private String pmDeptName;
	private String pmName;
	private String status;
	private Date startAt;
	private Date endAt;
	
	public DashboardProject() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashboardProject(String projectId, String title, String pmDeptName, String pmName, String status,
			Date startAt, Date endAt) {
		super();
		this.projectId = projectId;
		this.title = title;
		this.pmDeptName = pmDeptName;
		this.pmName = pmName;
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
