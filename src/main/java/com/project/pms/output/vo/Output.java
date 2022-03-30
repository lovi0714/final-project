package com.project.pms.output.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Output {
	private Integer outputId;
	private Integer outputType;
	private Integer categoryId;
	private Integer taskId;
	private Integer empId;
	private String content;
	private LocalDateTime createAt;
	private LocalDateTime updateAt;
	
	public Output() {
		super();
	}

	public Output(Integer outputId, Integer outputType, Integer categoryId, Integer taskId, Integer empId,
			String content) {
		super();
		this.outputId = outputId;
		this.outputType = outputType;
		this.categoryId = categoryId;
		this.taskId = taskId;
		this.empId = empId;
		this.content = content;
	}

	public Integer getOutputId() {
		return outputId;
	}

	public void setOutputId(Integer outputId) {
		this.outputId = outputId;
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

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public LocalDateTime getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDateTime updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "Output [outputId=" + outputId + ", outputType=" + outputType + ", categoryId=" + categoryId
				+ ", taskId=" + taskId + ", empId=" + empId + ", content=" + content + ", createAt=" + createAt
				+ ", updateAt=" + updateAt + "]";
	}
	
}
