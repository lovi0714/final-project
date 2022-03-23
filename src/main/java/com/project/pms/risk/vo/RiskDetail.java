package com.project.pms.risk.vo;

import java.sql.Date;

public class RiskDetail {
	private int riskId;
	private String title;
	private String rType;
	private String pName;
	private String tName;
	private String rContent;
	private String activator;
	private Date dueAt;
	private String aContent;
	private String rStatus;
	public RiskDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RiskDetail(int riskId, String title, String rType, String pName, String tName, String rContent,
			String activator, Date dueAt, String aContent, String rStatus) {
		super();
		this.riskId = riskId;
		this.title = title;
		this.rType = rType;
		this.pName = pName;
		this.tName = tName;
		this.rContent = rContent;
		this.activator = activator;
		this.dueAt = dueAt;
		this.aContent = aContent;
		this.rStatus = rStatus;
	}
	public int getRiskId() {
		return riskId;
	}
	public void setRiskId(int riskId) {
		this.riskId = riskId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getrType() {
		return rType;
	}
	public void setrType(String rType) {
		this.rType = rType;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getActivator() {
		return activator;
	}
	public void setActivator(String activator) {
		this.activator = activator;
	}
	public Date getDueAt() {
		return dueAt;
	}
	public void setDueAt(Date dueAt) {
		this.dueAt = dueAt;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	public String getrStatus() {
		return rStatus;
	}
	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

}
