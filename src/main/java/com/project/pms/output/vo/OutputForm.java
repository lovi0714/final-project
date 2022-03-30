package com.project.pms.output.vo;

import org.springframework.web.multipart.MultipartFile;

public class OutputForm {
	private Integer outputType;
	private Integer categoryId;
	private Integer taskId;
	private String content;
	private MultipartFile file;
	
	public OutputForm() {
	}

	public OutputForm(Integer outputType, Integer categoryId, Integer taskId, String content, MultipartFile file) {
		super();
		this.outputType = outputType;
		this.categoryId = categoryId;
		this.taskId = taskId;
		this.content = content;
		this.file = file;
	}

	public Integer getOutputType() {
		return outputType;
	}

	public void setOutputType(Integer outputType) {
		this.outputType = outputType;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getTaskId() {
		return taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "OutputForm [outputType=" + outputType + ", categoryId=" + categoryId + ", taskId=" + taskId
				+ ", content=" + content + ", file=" + file + "]";
	}
	
}
