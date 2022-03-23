package com.project.pms.resource.vo;

public class Resource {
	private Integer resourceId;
	private String projectId;
	private String empId;
	private String empName;
	private Integer positionId;
	private String position;
	
	public Resource() {
	}

	public Resource(Integer resourceId, String projectId, String empId, String empName, Integer positionId,
			String position) {
		super();
		this.resourceId = resourceId;
		this.projectId = projectId;
		this.empId = empId;
		this.empName = empName;
		this.positionId = positionId;
		this.position = position;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getPositionId() {
		return positionId;
	}

	public void setPositionId(Integer positionId) {
		this.positionId = positionId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Resource [resourceId=" + resourceId + ", projectId=" + projectId + ", empId=" + empId + ", empName="
				+ empName + ", positionId=" + positionId + ", position=" + position + "]";
	}
	
}
