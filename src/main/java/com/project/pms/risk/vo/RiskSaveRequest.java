package com.project.pms.risk.vo;




public class RiskSaveRequest {
	private int riskId;
	private String title;
	private int rTypeId;
	private String prjId;
	private int empId; 
	private int rStatusId;
	private String tName;
	private String rContent;
	private String empName;
	private String activator;
	private String aContent;
	private String dueAt;
	
	public RiskSaveRequest() {
		
	}

	public RiskSaveRequest(int riskId, String title, int rTypeId, String prjId, int empId, int rStatusId, String tName,
			String rContent, String presenter, String activator, String aContent, String dueAt) {
		super();
		this.riskId = riskId;
		this.title = title;
		this.rTypeId = rTypeId;
		this.prjId = prjId;
		this.empId = empId;
		this.rStatusId = rStatusId;
		this.tName = tName;
		this.rContent = rContent;
		this.empName = presenter;
		this.activator = activator;
		this.aContent = aContent;
		this.dueAt = dueAt;
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

	public int getrTypeId() {
		return rTypeId;
	}

	public void setrTypeId(int rTypeId) {
		this.rTypeId = rTypeId;
	}

	public String getPrjId() {
		return prjId;
	}

	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public int getrStatusId() {
		return rStatusId;
	}

	public void setrStatusId(int rStatusId) {
		this.rStatusId = rStatusId;
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

	public String getPresenter() {
		return empName;
	}

	public void setPresenter(String presenter) {
		this.empName = presenter;
	}

	public String getActivator() {
		return activator;
	}

	public void setActivator(String activator) {
		this.activator = activator;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getDueAt() {
		return dueAt;
	}

	public void setDueAt(String dueAt) {
		this.dueAt = dueAt;
	}
	
}
