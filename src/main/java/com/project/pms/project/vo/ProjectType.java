package com.project.pms.project.vo;

public class ProjectType {
	private Integer projectTypeId;
	private String projectType;
	
	public ProjectType() {
		super();
	}

	public ProjectType(Integer projectTypeId, String projectType) {
		super();
		this.projectTypeId = projectTypeId;
		this.projectType = projectType;
	}

	public Integer getProjectTypeId() {
		return projectTypeId;
	}

	public void setProjectTypeId(Integer projectTypeId) {
		this.projectTypeId = projectTypeId;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	@Override
	public String toString() {
		return "ProjectType [projectTypeId=" + projectTypeId + ", projectType=" + projectType + "]";
	}
	

}
