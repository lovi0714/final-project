package com.project.pms.project.vo;

public class ProjectSearchCriteria extends Criteria {
	private Integer projectTypeId;
	private Integer projectStatusId;
	private String keyword = "";
	private Integer start;
	private Integer length;
	
	public ProjectSearchCriteria() {
		super();
	}


	public ProjectSearchCriteria(Integer projectTypeId, Integer projectStatusId, String keyword, Integer start,
			Integer length) {
		super();
		this.projectTypeId = projectTypeId;
		this.projectStatusId = projectStatusId;
		this.keyword = keyword;
		this.start = start;
		this.length = length;
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
		return "ProjectSearchCriteria [projectTypeId=" + projectTypeId + ", projectStatusId=" + projectStatusId
				+ ", keyword=" + keyword + ", start=" + start + ", length=" + length + "]";
	}

}
