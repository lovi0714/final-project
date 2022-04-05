package com.project.pms.output.vo;

public class OutputSearchCriteria {
	private String projectId;
	private Integer outputCategoryId;
	private String keyword;
	
	public OutputSearchCriteria() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OutputSearchCriteria(String projectId, Integer outputCategoryId, String keyword) {
		super();
		this.projectId = projectId;
		this.outputCategoryId = outputCategoryId;
		this.keyword = keyword;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public Integer getOutputCategoryId() {
		return outputCategoryId;
	}

	public void setOutputCategoryId(Integer outputCategoryId) {
		this.outputCategoryId = outputCategoryId;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "OutputSearchCriteria [projectId=" + projectId + ", outputCategoryId=" + outputCategoryId + ", keyword="
				+ keyword + "]";
	}
	
}
