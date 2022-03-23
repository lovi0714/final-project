package com.project.pms.risk.vo;

import java.sql.Date;

public class RiskBoard {
	private int riskId;
	private String title;
	private String pName;
	private String rType;
	private String presenter;
	private String activator;
	private Date dueAt;
	private Date comAt;
	
	public RiskBoard() {

	}

	public RiskBoard(int riskId, String title, String pName, String rType, String presenter, String activator,
			Date dueAt, Date comAt) {
		super();
		this.riskId = riskId;
		this.title = title;
		this.pName = pName;
		this.rType = rType;
		this.presenter = presenter;
		this.activator = activator;
		this.dueAt = dueAt;
		this.comAt = comAt;
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

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getrType() {
		return rType;
	}

	public void setrType(String rType) {
		this.rType = rType;
	}

	public String getPresenter() {
		return presenter;
	}

	public void setPresenter(String presenter) {
		this.presenter = presenter;
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

	public Date getComAt() {
		return comAt;
	}

	public void setComAt(Date comAt) {
		this.comAt = comAt;
	}
	

}
