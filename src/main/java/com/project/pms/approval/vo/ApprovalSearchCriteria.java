package com.project.pms.approval.vo;

public class ApprovalSearchCriteria {
	private Integer empId;
	private String projectId;
	private String keyword;
	private Integer start;
	private Integer length;
	
	public ApprovalSearchCriteria() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ApprovalSearchCriteria(Integer empId, String projectId, String keyword, Integer start, Integer length) {
		super();
		this.empId = empId;
		this.projectId = projectId;
		this.keyword = keyword;
		this.start = start;
		this.length = length;
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

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	@Override
	public String toString() {
		return "ApprovalSearchCriteria [empId=" + empId + ", projectId=" + projectId + ", keyword=" + keyword
				+ ", start=" + start + ", length=" + length + "]";
	}
	
}
