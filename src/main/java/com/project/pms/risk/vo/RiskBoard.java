package com.project.pms.risk.vo;

import java.time.LocalDateTime;

public class RiskBoard {
	private int riskId;
	private String title;
	private String pName;
	private String tName;
	private String presenter;
	private String activator;
	private LocalDateTime dueAt;
	private LocalDateTime comAt;
	
	public RiskBoard() {

	}

	public RiskBoard(int riskId, String title, String pName, String tName, String presenter, String activator,
			LocalDateTime dueAt, LocalDateTime comAt) {
		super();
		this.riskId = riskId;
		this.title = title;
		this.pName = pName;
		this.tName = tName;
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

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
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

	public LocalDateTime getDueAt() {
		return dueAt;
	}

	public void setDueAt(LocalDateTime dueAt) {
		this.dueAt = dueAt;
	}

	public LocalDateTime getComAt() {
		return comAt;
	}

	public void setComAt(LocalDateTime comAt) {
		this.comAt = comAt;
	}
	

}
