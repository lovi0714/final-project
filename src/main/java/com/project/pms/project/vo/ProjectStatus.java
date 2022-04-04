package com.project.pms.project.vo;

public class ProjectStatus {
	private Integer statusId;
	private String status;
	
	public ProjectStatus() {
		super();
	}
	
	public ProjectStatus(Integer statusId, String status) {
		super();
		this.statusId = statusId;
		this.status = status;
	}
	
	public Integer getStatusId() {
		return statusId;
	}
	
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "ProjectStatus [statusId=" + statusId + ", status=" + status + "]";
	}
	
}
