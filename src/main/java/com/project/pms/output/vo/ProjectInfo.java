package com.project.pms.output.vo;

public class ProjectInfo {
	private String projectId;
	private String projectName;
	
	public ProjectInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProjectInfo(String projectId, String projectName) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
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

	@Override
	public String toString() {
		return "ProjectInfo [projectId=" + projectId + ", projectName=" + projectName + "]";
	}
	
}
