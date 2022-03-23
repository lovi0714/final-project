package com.project.pms.dashboard.vo;

public class DashboardChart {
	private String status;
	private int count;
	
	public DashboardChart() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DashboardChart(String status, int count) {
		super();
		this.status = status;
		this.count = count;
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
