package com.project.pms.output.vo;

import java.time.LocalDate;

public class OutputListForm {
	private Integer outputId;
	private String originalName;
	private String empName;
	private Integer categoryId;
	private String projectName;
	private Long volume;
	private String volumeText;
	private LocalDate updateAt;
	
	public OutputListForm() {
		super();
	}

	public OutputListForm(Integer outputId, String originalName, String empName, Integer categoryId, String projectName,
			Long volume, String volumeText, LocalDate updateAt) {
		super();
		this.outputId = outputId;
		this.originalName = originalName;
		this.empName = empName;
		this.categoryId = categoryId;
		this.projectName = projectName;
		this.volume = volume;
		this.volumeText = volumeText;
		this.updateAt = updateAt;
	}

	public Integer getOutputId() {
		return outputId;
	}

	public void setOutputId(Integer outputId) {
		this.outputId = outputId;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getVolume() {
		return volume;
	}

	public void setVolume(Long volume) {
		this.volume = volume;
	}

	public String getVolumeText() {
		return volumeText;
	}

	public void setVolumeText(String volumeText) {
		this.volumeText = volumeText;
	}

	public LocalDate getUpdateAt() {
		return updateAt;
	}

	public void setUpdateAt(LocalDate updateAt) {
		this.updateAt = updateAt;
	}

	@Override
	public String toString() {
		return "OutputListForm [outputId=" + outputId + ", originalName=" + originalName + ", empName=" + empName
				+ ", categoryId=" + categoryId + ", projectName=" + projectName + ", volume=" + volume + ", volumeText="
				+ volumeText + ", updateAt=" + updateAt + "]";
	}

}
