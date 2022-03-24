package com.project.pms.dashboard.vo;

public class DashboardChart {
	private int statusId;
	private String status;
	private int count;
	
	public DashboardChart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashboardChart(int statusId, String status, int count) {
		super();
		this.statusId = statusId;
		this.status = status;
		this.count = count;
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
