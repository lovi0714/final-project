package com.project.pms.output.vo;

public class OutputSearchCriteria {
	private String projectId;
	private Integer outputCategoryId;
	private String keyword;
	private Integer start;
	private Integer length;
	
	public OutputSearchCriteria() {
		super();
		// TODO Auto-generated constructor stub
	}


	public OutputSearchCriteria(String projectId, Integer outputCategoryId, String keyword, Integer start,
			Integer length) {
		super();
		this.projectId = projectId;
		this.outputCategoryId = outputCategoryId;
		this.keyword = keyword;
		this.start = start;
		this.length = length;
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
		return "OutputSearchCriteria [projectId=" + projectId + ", outputCategoryId=" + outputCategoryId + ", keyword="
				+ keyword + ", start=" + start + ", length=" + length + "]";
	}

}
