package com.project.pms.risk.vo;

import java.sql.Date;

public class Risk {
	private int riskId; // 리스크 ID
	private int rStatusId; // 상태 ID 
	private String rStatus; // 상태명
	private int rTypeId; // 유형 ID
	private String rType; // 유형명
	private int empId; // 사원 ID
	private String presenter; // 제기자
	private int pId; // 프로젝트 ID
	private String pName; // 프로젝트명
	private String tName; // 작업명
	private String title; // 제목
	private String rContent; // 리스크 내용
	private String activator; // 조치자
	private String aContent; // 조치 내용
	private Date dueAt; // 조치 희망일
	private Date comAt; // 조치 완료일
	private Date createDate; // 생성일
	private Date updateDate; // 수정일시 
	
	public Risk() {
		
	}
	public Risk(int riskId, int rStatusId, String rStatus, int rTypeId, String rType, int empId, String presenter,
			int pId, String pName, String tName, String title, String rContent, String activator, String aContent,
			Date dueAt, Date comAt, Date createDate, Date updateDate) {
		super();
		this.riskId = riskId;
		this.rStatusId = rStatusId;
		this.rStatus = rStatus;
		this.rTypeId = rTypeId;
		this.rType = rType;
		this.empId = empId;
		this.presenter = presenter;
		this.pId = pId;
		this.pName = pName;
		this.tName = tName;
		this.title = title;
		this.rContent = rContent;
		this.activator = activator;
		this.aContent = aContent;
		this.dueAt = dueAt;
		this.comAt = comAt;
		this.createDate = createDate;
		this.updateDate = updateDate;
	}
	public int getRiskId() {
		return riskId;
	}
	public void setRiskId(int riskId) {
		this.riskId = riskId;
	}
	public int getrStatusId() {
		return rStatusId;
	}
	public void setrStatusId(int rStatusId) {
		this.rStatusId = rStatusId;
	}
	public String getrStatus() {
		return rStatus;
	}
	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}
	public int getrTypeId() {
		return rTypeId;
	}
	public void setrTypeId(int rTypeId) {
		this.rTypeId = rTypeId;
	}
	public String getrType() {
		return rType;
	}
	public void setrType(String rType) {
		this.rType = rType;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getPresenter() {
		return presenter;
	}
	public void setPresenter(String presenter) {
		this.presenter = presenter;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getaContent() {
		return aContent;
	}
	public void setaContnent(String aContent) {
		this.aContent = aContent;
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
}
