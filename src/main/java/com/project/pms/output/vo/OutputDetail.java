package com.project.pms.output.vo;

public class OutputDetail {
	private Integer outputId;
	private Integer outputFileId;
	private String originalName;
	private String projectId;
	private String projectName;
	private String content;
	private Integer categoryId;
	private Integer typeId;
	private Integer taskId;
	private String taskName;
	
	public OutputDetail() {
		super();
	}

	public OutputDetail(Integer outputId, Integer outputFileId, String originalName, String projectId,
			String projectName, String content, Integer categoryId, Integer typeId, Integer taskId, String taskName) {
		super();
		this.outputId = outputId;
		this.outputFileId = outputFileId;
		this.originalName = originalName;
		this.projectId = projectId;
		this.projectName = projectName;
		this.content = content;
		this.categoryId = categoryId;
		this.typeId = typeId;
		this.taskId = taskId;
		this.taskName = taskName;
	}

	public Integer getOutputId() {
		return outputId;
	}

	public void setOutputId(Integer outputId) {
		this.outputId = outputId;
	}

	public Integer getOutputFileId() {
		return outputFileId;
	}

	public void setOutputFileId(Integer outputFileId) {
		this.outputFileId = outputFileId;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	@Override
	public String toString() {
		return "OutputDetail [outputId=" + outputId + ", outputFileId=" + outputFileId + ", originalName="
				+ originalName + ", projectId=" + projectId + ", projectName=" + projectName + ", content=" + content
				+ ", categoryId=" + categoryId + ", typeId=" + typeId + ", taskId=" + taskId + ", taskName=" + taskName
				+ "]";
	}

}
