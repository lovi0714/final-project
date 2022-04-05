package com.project.pms.project.vo;

public class ProjectSearchCriteria extends Criteria {
	private Integer projectTypeId;
	private Integer projectStatusId;
	private String keyword = "";
	
	public ProjectSearchCriteria() {
		super();
	}

	public ProjectSearchCriteria(Integer projectTypeId, Integer projectStatusId, String keyword) {
		super();
		this.projectTypeId = projectTypeId;
		this.projectStatusId = projectStatusId;
		this.keyword = keyword;
	}

	public Integer getProjectTypeId() {
		return projectTypeId;
	}

	public void setProjectTypeId(Integer projectTypeId) {
		this.projectTypeId = projectTypeId;
	}

	public Integer getProjectStatusId() {
		return projectStatusId;
	}

	public void setProjectStatusId(Integer projectStatusId) {
		this.projectStatusId = projectStatusId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchCriteria [projectTypeId=" + projectTypeId + ", projectStatusId=" + projectStatusId + ", keyword="
				+ keyword + "]";
	}
	
}
