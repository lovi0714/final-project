package com.project.pms.approval.vo;

public class ApprovalSearchCriteria {
	private Integer empId;
	private String projectId;
	private String keyword;
	public ApprovalSearchCriteria() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApprovalSearchCriteria(Integer empId, String projectId, String keyword) {
		super();
		this.empId = empId;
		this.projectId = projectId;
		this.keyword = keyword;
	}
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "ApprovalSearchCriteria [empId=" + empId + ", projectId=" + projectId + ", keyword=" + keyword + "]";
	}
}
